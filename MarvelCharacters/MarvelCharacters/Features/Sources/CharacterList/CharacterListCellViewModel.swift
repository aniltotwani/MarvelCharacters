import Foundation

struct CharacterListCellViewModel: Equatable {
    let name: String
    let imageURL: URL?

    init(model: CharactersModel) {
        self.name = model.name
        self.imageURL =  model.thumbnail
    }
}
