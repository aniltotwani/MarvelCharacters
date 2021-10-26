@testable import MarvelCharacters

class CharacterListViewMock: CharacterListViewContract {
    var viewState: CharacterListViewState?
    var presenter: CharacterListPresenterContract!

    func changeViewState(_ state: CharacterListViewState) {
        viewState = state
    }
}
