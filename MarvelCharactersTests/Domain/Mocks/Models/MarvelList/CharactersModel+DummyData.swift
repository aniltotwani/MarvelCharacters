import Foundation

@testable import MarvelCharacters

extension CharactersModel {
    static func dummyInstance() -> CharactersModel {
        CharactersModel(id: 123,
                        name: "Test",
                        thumbnail: URL(string: "www.testurl.com"))
    }
}
