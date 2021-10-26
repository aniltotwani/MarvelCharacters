import Alamofire
import XCTest
@testable import MarvelCharacters

class CharacterDetailsUseCaseTests: XCTestCase {
    private var characterDetailsUseCase: CharacterDetailsUseCaseContract!
    var characterServiceProviderMock = CharacterServiceProviderMock()

    override func setUp() {
        super.setUp()
        characterDetailsUseCase = CharacterDetailsUseCase(provider: characterServiceProviderMock)
    }

    func testGetCharacterDetailsUseCaseFailure() {
        let expectation = XCTestExpectation(description: "Error")
        characterServiceProviderMock.getCharacterDetails = .failure(.inValidURL)
        let params = CharacterDetailsParams(characterID: 123) { result in
            if case .failure = result {
                expectation.fulfill()
            }
        }
        characterDetailsUseCase.run(params)
        wait(for: [expectation], timeout: 2)
    }
}
