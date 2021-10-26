import Foundation

@testable import MarvelCharacters

class CharacterListNavigationBuilderMock: CharacterLisNavigationBuilderContract {
    var navigateToMarvelDetailsCalled = false

    func navigateToCharacterDetails(id: Int) {
        navigateToMarvelDetailsCalled = true
    }
}
