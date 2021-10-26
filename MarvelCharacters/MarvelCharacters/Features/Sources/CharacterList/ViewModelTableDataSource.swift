import Foundation

protocol ViewModelTableDataSource {
    func numberOfItemsIn(section: Int) -> Int
    func viewModelAt(indexPath: IndexPath) -> CharacterListCellViewModel?
    func didSelectItemAt(indexPath: IndexPath)
}
