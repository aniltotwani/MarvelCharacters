import Foundation

enum CharacterListViewState: State {
    case clear
    case loading
    case render
    case showError
}

struct CharacterListDependencies {
    var view: CharacterListViewContract?
    var navigationBuilder: CharacterLisNavigationBuilderContract?
}

protocol CharacterListPresenterContract: PresenterContract, ViewModelTableDataSource {
    func setupDependencies(_ dependencies: CharacterListDependencies)
    func didScrollToEnd()
    func numberOfItemsIn(section: Int) -> Int
    func viewModelAt(indexPath: IndexPath) -> CharacterListCellViewModel?
    func didSelectItemAt(indexPath: IndexPath)
}

final class CharacterListPresenter: CharacterListPresenterContract {
    weak var view: CharacterListViewContract?
    var navigationBuilder: CharacterLisNavigationBuilderContract?
    private var characterListUseCase : CharacterListUseCaseContract?
    private var characterModels: [CharactersModel] = []
    private var characterListModel: CharacterListModel?
    private var offset = 0
    private var limit = 30
    private var loadNewCharacters = true
    private var viewState: CharacterListViewState = .clear {
        didSet {
            guard oldValue != viewState else {
                return
            }
            view?.changeViewState(viewState)
        }
    }

    init(characterListUseCase: CharacterListUseCaseContract = CharacterListUseCase()) {
        self.characterListUseCase = characterListUseCase
    }

    func setupDependencies(_ dependencies: CharacterListDependencies) {
        view = dependencies.view
        navigationBuilder = dependencies.navigationBuilder
    }

    func viewLoaded() {
        fetchCharacterList()
    }

    func didScrollToEnd() {
        loadMoreCharacters()
    }
}

private extension CharacterListPresenter {
    func fetchCharacterList() {
        guard viewState != .loading, loadNewCharacters else {
            return
        }
        viewState = .loading
        let requestModel = CharacterListRequestModel(offset: offset, limit: limit)
        let params = CharacterListParams(requestModel: requestModel) { [weak self] result in
            switch result {
            case let .success(characterListModel):
                self?.renderModel(characterListModel)
            case .failure:
                self?.showError()
            }
        }
        characterListUseCase?.run(params)
    }

    func renderModel(_ characterListModel: CharacterListModel) {
        self.characterListModel = characterListModel
        offset = characterListModel.offset + 1
        limit = characterListModel.limit
        characterModels.append(contentsOf: characterListModel.items)
        viewState = .render
    }

    func showError() {
        viewState = .showError
    }

    func loadMoreCharacters() {
        guard let characterListModel = characterListModel,
              characterModels.count < characterListModel.total else {
                  loadNewCharacters = false
                  viewState = .clear
                  return
        }
        fetchCharacterList()
    }
}

extension CharacterListPresenter: ViewModelTableDataSource {
    func numberOfItemsIn(section: Int) -> Int {
        return characterModels.count
    }

    func viewModelAt(indexPath: IndexPath) -> CharacterListCellViewModel? {
        return CharacterListCellViewModel(model: characterModels[indexPath.row])
    }

    func didSelectItemAt(indexPath: IndexPath) {
        navigationBuilder?.navigateToCharacterDetails(id: characterModels[indexPath.row].id)
    }
}
