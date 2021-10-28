import Foundation
@testable import MarvelCharacters

final class CharacterDetailsPresenterMock: CharacterDetailsPresenterContract {
    var characterID: Int?
    var view: CharacterDetailsViewContract?
}
