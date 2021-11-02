import Foundation

final class CharacterListBuilder {
    let view: CharacterListViewContract
    let presenter: CharacterListPresenterContract
    var navigationBuilder: CharacterListNavigationBuilderContract
    weak var navigator: MainNavigator?

    init(view: CharacterListViewContract = CharacterListViewController.constructViewController(),
         presenter: CharacterListPresenterContract = CharacterListPresenter(),
         navigationBuilder: CharacterListNavigationBuilderContract = CharacterListNavigationBuilder()) {
        self.view = view
        self.presenter = presenter
        self.navigationBuilder = navigationBuilder
    }

    func build() -> CharacterListViewContract {
        let dependencies = CharacterListDependencies(view: view,
                                                     navigationBuilder: CharacterListNavigationBuilder(navigator: navigator))
        presenter.setupDependencies(dependencies)
        view.presenter = presenter
        return view
    }
}
