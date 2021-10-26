import Foundation
import UIKit

class CharacterDetailNavigator: Navigator {
    var childNavigators = [Navigator]()

    var navigationController: UINavigationController
    var id: Int

    init(navigationController: UINavigationController, id: Int) {
        self.navigationController = navigationController
        self.id = id
    }

    func run() {
        guard let characterDetailsViewController = CharacterDetailsBuilder().build(id: id) as? CharacterDetailsViewController else {
            return
        }
        navigationController.pushViewController(characterDetailsViewController, animated: true)
    }
}
