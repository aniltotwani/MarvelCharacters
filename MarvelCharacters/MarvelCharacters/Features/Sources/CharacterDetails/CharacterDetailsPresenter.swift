import Foundation

enum CharacterDetailsViewState: State {
    case clear
    case loading
    case render(CharacterDetailsViewModel)
    case showError
}

protocol CharacterDetailsPresenterContract: PresenterContract {
    var view: CharacterDetailsViewContract? { get set }
    var characterID: Int? { get set}
}

final class CharacterDetailsPresenter: CharacterDetailsPresenterContract {
    weak var view: CharacterDetailsViewContract?
    var characterID: Int?
    private var characterDetailsModel: CharacterDetailsModel?
    private let characterDetailsUseCase : CharacterDetailsUseCaseContract?

    init(characterDetailsUseCase: CharacterDetailsUseCaseContract = CharacterDetailsUseCase()) {
        self.characterDetailsUseCase = characterDetailsUseCase
    }

    private var viewState: CharacterDetailsViewState = .clear {
        didSet {
            guard oldValue != viewState else {
                return
            }
            view?.changeViewState(viewState)
        }
    }

    func viewLoaded() {
        fetchCharacterDetails(characterID)
    }
}

private extension CharacterDetailsPresenter {
    func fetchCharacterDetails(_ characterID: Int?) {
        guard let characterID = characterID else {
            return
        }
        viewState = .loading
        let params = CharacterDetailsParams(characterID: characterID) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case let .success(characterDetailsModel):
                self.characterDetailsModel = characterDetailsModel
                self.renderViewModel()
            case .failure:
                self.showError()
            }
        }
        characterDetailsUseCase?.run(params)
    }

    func renderViewModel() {
        self.viewState = .render(mapModelToViewModel())
    }

    func showError() {
        viewState = .showError
    }

    func mapModelToViewModel() -> CharacterDetailsViewModel {
        return CharacterDetailsViewModel(name: characterDetailsModel?.name ?? "",
                                         descriptionText: characterDetailsModel?.description ?? "",
                                         thumbnailURL: characterDetailsModel?.thumbnail)
    }
}
