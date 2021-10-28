import XCTest
@testable import MarvelCharacters

final class CharacterDetailsBuilderTests: XCTestCase {

    private let characterDetailsPresenter = CharacterDetailsPresenterMock()
    private let characterDetailsViewMock = CharacterDetailsViewMock()
    private var builder: CharacterDetailsBuilder!

    func testBuild() {
        builder = CharacterDetailsBuilder(view: characterDetailsViewMock,
                                          presenter: characterDetailsPresenter)
        let view = builder.build(id: 1111)
        XCTAssertNotNil(characterDetailsPresenter.view)
        XCTAssertNotNil(view.presenter)
    }
}
