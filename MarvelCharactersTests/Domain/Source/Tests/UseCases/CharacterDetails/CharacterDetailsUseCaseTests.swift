import XCTest
@testable import MarvelCharacters

final class CharacterDetailsUseCaseTests: XCTestCase {
    private var characterDetailsUseCase: CharacterDetailsUseCaseContract!
    var characterServiceProviderMock = CharacterServiceProviderMock()

    override func setUp() {
        super.setUp()
        characterDetailsUseCase = CharacterDetailsUseCase(provider: characterServiceProviderMock)
    }

    func testGetCharacterDetailsUseCaseWithSuccess() {
        let expectation = expectation(description: "Success")
        characterServiceProviderMock.getCharacterDetails = .success(CharacterDetailsModel.dummyInstance())
        let params = CharacterDetailsParams(characterID: 1111) { result in
            if case .success = result {
                expectation.fulfill()
            }
        }
        characterDetailsUseCase.run(params)
        wait(for: [expectation], timeout: 1)
    }

    func testGetCharacterDetailsUseCaseWithFailure() {
        let expectation = expectation(description: "Error")
        characterServiceProviderMock.getCharacterDetails = .failure(UseCaseError.inValidURL)
        let params = CharacterDetailsParams(characterID: 1111) { result in
            if case .failure = result {
                expectation.fulfill()
            }
        }
        characterDetailsUseCase.run(params)
        wait(for: [expectation], timeout: 1)
    }
}
