@testable import MarvelCharacters

extension CharacterListRequestModel {
    static func dummyInstance() -> CharacterListRequestModel {
        CharacterListRequestModel(offset: 1, limit: 20)
    }
}
