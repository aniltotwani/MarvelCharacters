import Foundation

@testable import MarvelCharacters

extension CharactersModel {
    static func dummyInstance() -> CharactersModel {
        CharactersModel(id: 1111,
                        name: "character name",
                        thumbnail: URL(string: "www.image.com"))
    }
}
