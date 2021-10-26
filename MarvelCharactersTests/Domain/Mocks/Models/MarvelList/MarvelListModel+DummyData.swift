@testable import MarvelCharacters

extension CharacterListModel {
    static func dummyInstance() -> CharacterListModel {
        CharacterListModel(offset: 1,
                        limit: 20,
                        total: 100,
                        items: [CharactersModel.dummyInstance()])
    }
}






