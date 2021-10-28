@testable import MarvelCharacters

final class CharacterDetailsViewMock: CharacterDetailsViewContract {
    var viewState: CharacterDetailsViewState?
    var presenter: CharacterDetailsPresenterContract!

    func changeViewState(_ state: CharacterDetailsViewState) {
        viewState = state
    }
}
