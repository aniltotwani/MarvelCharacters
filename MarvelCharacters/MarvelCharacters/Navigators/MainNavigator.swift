import Foundation
import UIKit

protocol MainNavigatorContract: Navigator {
    func navigateToCharacterDetail(id: Int)
}

final class MainNavigator: MainNavigatorContract {
    var childNavigators = [Navigator]()

    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }

    func run() {
        let builder = CharacterListBuilder()
        builder.navigator = self
        guard let characterListController = builder.build() as? CharacterListViewController else {
            return
        }
        navigationController.pushViewController(characterListController, animated: false)
    }

    func navigateToCharacterDetail(id: Int) {
        let detailNavigator = CharacterDetailNavigator(navigationController: navigationController, id: id)
        childNavigators.append(detailNavigator)
        detailNavigator.run()
    }
}
