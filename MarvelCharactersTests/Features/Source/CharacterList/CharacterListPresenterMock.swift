import Foundation
import UIKit
@testable import MarvelCharacters

class CharacterListPresenterMock: CharacterListPresenterContract {

    func numberOfItemsIn(section: Int) -> Int {
        return 0
    }

    func didSelectItemAt(indexPath: IndexPath) {}

    var navigationBuilder: CharacterLisNavigationBuilderContract?

    var view: CharacterListViewContract?

    func viewModelAt(indexPath: IndexPath) -> CharacterListCellViewModel? {
        return nil
    }

    func didScrollToEnd() { }

    func setupDependencies(_ dependencies: CharacterListDependencies) {}
}
