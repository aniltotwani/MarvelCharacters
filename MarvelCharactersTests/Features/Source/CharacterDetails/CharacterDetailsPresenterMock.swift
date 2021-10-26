import Foundation
@testable import MarvelCharacters

class CharacterDetailsPresenterMock: CharacterDetailsPresenterContract {
    var characterID: Int?
    var view: CharacterDetailsViewContract?
}
