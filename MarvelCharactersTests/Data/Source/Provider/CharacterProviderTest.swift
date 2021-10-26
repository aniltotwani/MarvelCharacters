import Alamofire
import XCTest
@testable import MarvelCharacters

class CharacterProviderTest: XCTestCase {
    func testGetCharacterListAPISuccess() {
        let success = expectation(description: "success")
        let mockData = getMock(name: "CharacterList")
        let netMock = NetworkServiceMock(responseHandler: .success(mockData))
        let provider = CharacterServiceProvider(serviceRequest: netMock)
        provider.getCharacterList(requestModel: CharacterListRequestModel.dummyInstance()) { result in
            if case .success = result {
                success.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testGetCharacterListAPIFailure() {
        let error = expectation(description: "Error")
        let mock = NetworkServiceMock(responseHandler: .failure(.inValidURL))
        let provider = CharacterServiceProvider(serviceRequest: mock)
        provider.getCharacterList(requestModel: CharacterListRequestModel.dummyInstance()) { result in
            if case .failure = result {
                error.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testGetCharacterDetailsAPISuccess() {
        let success = expectation(description: "success")
        let mockData = getMock(name: "CharacterList")
        let mock = NetworkServiceMock(responseHandler: .success(mockData))
        let provider = CharacterServiceProvider(serviceRequest: mock)
        provider.getCharacterDetails(characterID: 123) { result in
            if case .success = result {
                success.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testGetCharacterDetailsAPIFailure() {
        let error = expectation(description: "Error")
        let mock = NetworkServiceMock(responseHandler: .failure(.inValidURL))
        let provider = CharacterServiceProvider(serviceRequest: mock)
        provider.getCharacterDetails(characterID: 123) { result in
            if case .failure = result {
                error.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func getMock(name: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let filePath = bundle.path(forResource: name, ofType: "json"),
              let data = try? String(contentsOfFile: filePath).data(using: .utf8) else {
            return Data()
        }
        return data
    }
}
