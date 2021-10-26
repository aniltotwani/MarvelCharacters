import XCTest
@testable import MarvelCharacters

class CharacterListNavigationBuilderTests: XCTestCase {

    let coordinatorMock = CoordinatorMock()
    private var builder: CharacterLisNavigationBuilder!

    func testNavigateToMarvelDetails() {
        builder = CharacterLisNavigationBuilder(navigator: coordinatorMock)
        builder.navigateToCharacterDetails(id: 123)
        XCTAssertTrue(coordinatorMock.navigateToDetailCalled)
    }
}
