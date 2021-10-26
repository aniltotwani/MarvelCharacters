import Alamofire
import XCTest

@testable import MarvelCharacters

class CharacterListUseCaseTests: XCTestCase {
    private var characterListUseCase: CharacterListUseCaseContract!
    var characterServiceProviderMock = CharacterServiceProviderMock()

    override func setUp() {
        super.setUp()
        characterListUseCase = CharacterListUseCase(provider: characterServiceProviderMock)
    }

    func testGetCharacterListUseCaseSuccess() {
        let expectation = XCTestExpectation(description: "Success")
        characterServiceProviderMock.getCharacterList = .success(CharacterListModel.dummyInstance())
        let params = CharacterListParams(requestModel: CharacterListRequestModel.dummyInstance()) { result in
            if case .success = result {
                expectation.fulfill()
            }
        }
        characterListUseCase.run(params)
        wait(for: [expectation], timeout: 2)
    }
}
