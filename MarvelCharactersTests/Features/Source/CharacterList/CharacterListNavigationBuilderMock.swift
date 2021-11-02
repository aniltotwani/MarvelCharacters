import Foundation

@testable import MarvelCharacters

final class CharacterListNavigationBuilderMock: CharacterListNavigationBuilderContract {
    var navigateToMarvelDetailsCalled = false

    func navigateToCharacterDetails(id: Int) {
        navigateToMarvelDetailsCalled = true
    }
}
