@testable import MarvelCharacters
import UIKit

class CoordinatorMock: MainNavigatorContract {
    var childNavigators: [Navigator] = []
    var navigationController: UINavigationController = UINavigationController()
    var runCalled = false
    var navigateToDetailCalled = false

    func run() {
        runCalled = true
    }

    func navigateToCharacterDetail(id: Int) {
        navigateToDetailCalled = true
    }
}
