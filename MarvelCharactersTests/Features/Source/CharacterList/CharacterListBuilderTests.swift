import XCTest
@testable import MarvelCharacters

final class CharacterListBuilderTests: XCTestCase {

    private let presenterMock = CharacterListPresenterMock()
    private let mockView = CharacterListViewMock()
    private var builder: CharacterListBuilder!

    func testBuild() {
        builder = CharacterListBuilder(view: mockView,
                                       presenter: presenterMock)
        let view = builder.build()
        XCTAssertNotNil(view.presenter)
    }
}
