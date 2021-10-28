import Foundation

@testable import MarvelCharacters

final class CharacterListNavigationBuilderMock: CharacterLisNavigationBuilderContract {
    var navigateToMarvelDetailsCalled = false

    func navigateToCharacterDetails(id: Int) {
        navigateToMarvelDetailsCalled = true
    }
}
