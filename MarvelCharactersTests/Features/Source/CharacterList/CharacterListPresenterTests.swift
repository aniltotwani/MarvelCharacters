import Alamofire
import Foundation
import XCTest
@testable import MarvelCharacters

class CharacterListPresenterTests: XCTestCase {
    
    var presenter: CharacterListPresenter!
    var mockCharacterListView: CharacterListViewMock = CharacterListViewMock()
    var characterListPresenterUseCaseMock = CharacterListUseCaseMock()
    var characterListNavigationBuilderMock = CharacterListNavigationBuilderMock()

    override func setUp() {
        super.setUp()
        presenter = CharacterListPresenter(characterListUseCase: characterListPresenterUseCaseMock)
        presenter.view = mockCharacterListView
        presenter.navigationBuilder = characterListNavigationBuilderMock
        mockCharacterListView.presenter = presenter
    }

    func testGetCharacterListWithSuccess() {
        characterListPresenterUseCaseMock.result = .success(CharacterListModel.dummyInstance())
        presenter.viewLoaded()
        XCTAssertEqual(mockCharacterListView.viewState, .render)
    }

    func testGetCharacterListWithFailure() {
        characterListPresenterUseCaseMock.result = .failure(.inValidURL)
        presenter.viewLoaded()
        XCTAssertEqual(mockCharacterListView.viewState, .showError)
    }

    func testNumberOfItems() {
        characterListPresenterUseCaseMock.result = .success(CharacterListModel.dummyInstance())
        presenter.viewLoaded()
        XCTAssertEqual(presenter.numberOfItemsIn(section: 0), 1)
    }

    func testViewModelAtIndex() {
        characterListPresenterUseCaseMock.result = .success(CharacterListModel.dummyInstance())
        presenter.viewLoaded()
        XCTAssertNotNil(presenter.viewModelAt(indexPath: IndexPath(row: 0, section: 0)))
    }

    func testDidSelectItemAt() {
        characterListPresenterUseCaseMock.result = .success(CharacterListModel.dummyInstance())
        presenter.viewLoaded()
        presenter.didSelectItemAt(indexPath: IndexPath(row: 0, section: 0))
        XCTAssertTrue(characterListNavigationBuilderMock.navigateToMarvelDetailsCalled)
    }

    func testDidScrollToEnd() {
        characterListPresenterUseCaseMock.result = .success(CharacterListModel.dummyInstance())
        presenter.viewLoaded()
        presenter.didScrollToEnd()
        XCTAssertEqual(mockCharacterListView.viewState, .render)
    }
}
