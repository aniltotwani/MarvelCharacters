@testable import MarvelCharacters

final class CharacterListViewMock: CharacterListViewContract {
    var viewState: CharacterListViewState?
    var presenter: CharacterListPresenterContract!

    func changeViewState(_ state: CharacterListViewState) {
        viewState = state
    }
}
