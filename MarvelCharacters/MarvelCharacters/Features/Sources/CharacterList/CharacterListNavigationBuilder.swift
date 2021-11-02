import Foundation

protocol CharacterListNavigationBuilderContract {
    func navigateToCharacterDetails(id: Int)
}

final class CharacterListNavigationBuilder: CharacterListNavigationBuilderContract {
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
