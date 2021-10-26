import Alamofire
import XCTest
@testable import MarvelCharacters

class CharacterDetailsPresenterTests: XCTestCase {
    var presenter: CharacterDetailsPresenter!
    var mockView = CharacterDetailsViewMock()
    var useCaseMock = CharacterDetailsUseCaseMock()

    override func setUp() {
        super.setUp()
        presenter = CharacterDetailsPresenter(characterDetailsUseCase: useCaseMock)
        presenter.view = mockView
        mockView.presenter = presenter
        presenter.characterID = 1111
    }

    func testFetchCharacterDetailsWithFailure() {
        useCaseMock.result = .failure(.inValidURL)
        presenter.viewLoaded()
        XCTAssertEqual(mockView.viewState, .showError)
    }

    func testFetchCharacterDetailsWithSuccess() {
        useCaseMock.result = .success(CharacterDetailsModel.dummyInstance())
        presenter.viewLoaded()
        let expectedModel = CharacterDetailsViewModel(name: "character name",
                                                      descriptionText: "character description",
                                                      thumbnailURL: URL(string: "www.image.com"))
        XCTAssertEqual(mockView.viewState, .render(expectedModel))
    }

}
