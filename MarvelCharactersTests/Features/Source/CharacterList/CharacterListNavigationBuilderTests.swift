import XCTest
@testable import MarvelCharacters

final class CharacterListNavigationBuilderTests: XCTestCase {

    let navigatorMock = NavigatorMock()
    private var builder: CharacterLisNavigationBuilder!

    func testNavigateToCharacterDetails() {
        builder = CharacterLisNavigationBuilder(navigator: navigatorMock)
        builder.navigateToCharacterDetails(id: 1111)
        XCTAssertTrue(navigatorMock.navigateToDetailCalled)
    }
}
