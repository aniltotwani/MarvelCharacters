import Foundation

final class CharacterListBuilder {
    let view: CharacterListViewContract
    let presenter: CharacterListPresenterContract
    var navigationBuilder: CharacterLisNavigationBuilderContract
    weak var navigator: MainNavigator?

    init(view: CharacterListViewContract = CharacterListViewController.constructViewController(),
         presenter: CharacterListPresenterContract = CharacterListPresenter(),
         navigationBuilder: CharacterLisNavigationBuilderContract = CharacterLisNavigationBuilder()) {
        self.view = view
        self.presenter = presenter
        self.navigationBuilder = navigationBuilder
    }

    func build() -> CharacterListViewContract {
        let dependencies = CharacterListDependencies(view: view,
                                                     navigationBuilder: CharacterLisNavigationBuilder(navigator: navigator))
        presenter.setupDependencies(dependencies)
        view.presenter = presenter
        return view
    }
}
