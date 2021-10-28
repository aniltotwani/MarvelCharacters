import XCTest
@testable import MarvelCharacters

final class CharacterProviderTest: XCTestCase {
    private let provider = CharacterServiceProviderMock()
    func testGetCharacterListWithSuccess() {
        let success = expectation(description: "success")
        provider.getCharacterList = .success(CharacterListModel.dummyInstance())
        provider.getCharacterList(requestModel: CharacterListRequestModel.dummyInstance()) { result in
            if case .success = result {
                success.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testGetCharacterListWithFailure() {
        let error = expectation(description: "Error")
        provider.getCharacterList = .failure(.inValidURL)
        provider.getCharacterList(requestModel: CharacterListRequestModel.dummyInstance()) { result in
            if case .failure = result {
                error.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testGetCharacterDetailsWithSuccess() {
        let success = expectation(description: "success")
        provider.getCharacterDetails = .success(CharacterDetailsModel.dummyInstance())
        provider.getCharacterDetails(characterID: 1111) { result in
            if case .success = result {
                success.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testGetCharacterDetailsWithFailure() {
        let error = expectation(description: "Error")
        provider.getCharacterDetails = .failure(.inValidURL)
        provider.getCharacterDetails(characterID: 1111) { result in
            if case .failure = result {
                error.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
