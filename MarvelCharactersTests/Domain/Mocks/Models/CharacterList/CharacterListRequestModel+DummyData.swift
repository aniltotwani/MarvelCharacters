@testable import MarvelCharacters

extension CharacterListRequestModel {
    static func dummyInstance() -> CharacterListRequestModel {
        CharacterListRequestModel(offset: 0, limit: 20)
    }
}
