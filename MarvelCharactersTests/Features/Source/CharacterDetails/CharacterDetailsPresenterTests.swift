import XCTest
@testable import MarvelCharacters

final class CharacterDetailsPresenterTests: XCTestCase {
    var characterDetailsPresenter: CharacterDetailsPresenter!
    var characterDetailsViewMock = CharacterDetailsViewMock()
    var characterDetailsUseCaseMock = CharacterDetailsUseCaseMock()

    override func setUp() {
        super.setUp()
        characterDetailsPresenter = CharacterDetailsPresenter(characterDetailsUseCase: characterDetailsUseCaseMock)
        characterDetailsPresenter.view = characterDetailsViewMock
        characterDetailsViewMock.presenter = characterDetailsPresenter
        characterDetailsPresenter.characterID = 1111
    }

    func testFetchCharacterDetailsWithFailure() {
        characterDetailsUseCaseMock.result = .failure(.inValidURL)
        characterDetailsPresenter.viewLoaded()
        XCTAssertEqual(characterDetailsViewMock.viewState, .showError)
    }

    func testFetchCharacterDetailsWithSuccess() {
        characterDetailsUseCaseMock.result = .success(CharacterDetailsModel.dummyInstance())
        characterDetailsPresenter.viewLoaded()
        let characterDetailsViewModel = CharacterDetailsViewModel(name: "character name",
                                                                  descriptionText: "character description",
                                                                  thumbnailURL: URL(string: "www.image.com"))
        XCTAssertEqual(characterDetailsViewMock.viewState, .render(characterDetailsViewModel))
    }

}
