import XCTest

@testable import MarvelCharacters

final class CharacterListUseCaseTests: XCTestCase {
    private var characterListUseCase: CharacterListUseCaseContract!
    var characterServiceProviderMock = CharacterServiceProviderMock()

    override func setUp() {
        super.setUp()
        characterListUseCase = CharacterListUseCase(provider: characterServiceProviderMock)
    }

    func testGetCharacterListUseCaseWithSuccess() {
        let expectation = expectation(description: "Success")
        characterServiceProviderMock.getCharacterList = .success(CharacterListModel.dummyInstance())
        let params = CharacterListParams(requestModel: CharacterListRequestModel.dummyInstance()) { result in
            if case .success = result {
                expectation.fulfill()
            }
        }
        characterListUseCase.run(params)
        wait(for: [expectation], timeout: 1)
    }

    func testGetCharacterListUseCaseWithFailure() {
        let expectation = expectation(description: "Error")
        characterServiceProviderMock.getCharacterList = .failure(.inValidURL)
        let params = CharacterListParams(requestModel: CharacterListRequestModel.dummyInstance()) { result in
            if case .failure = result {
                expectation.fulfill()
            }
        }
        characterListUseCase.run(params)
        wait(for: [expectation], timeout: 1)
    }
}
