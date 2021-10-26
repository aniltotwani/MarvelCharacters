import Foundation

protocol CharacterLisNavigationBuilderContract {
    func navigateToCharacterDetails(id: Int)
}

final class CharacterLisNavigationBuilder: CharacterLisNavigationBuilderContract {
    var navigator: MainNavigatorContract?

    init(navigator: MainNavigatorContract? = MainNavigator()) {
        self.navigator = navigator
    }

    func navigateToCharacterDetails(id: Int) {
        guard let navigator = navigator else {
            return
        }
        navigator.navigateToCharacterDetail(id: id)
    }
}
