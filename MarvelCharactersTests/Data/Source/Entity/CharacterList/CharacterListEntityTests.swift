import XCTest

@testable import MarvelCharacters

final class CharacterListEntityTests: XCTestCase {
    func testCharacterListEntityToDomain() {
        let entity = CharacterListEntity(offset: 0,
                                         limit: 20,
                                         total: 1111,
                                         results: [CharactersEntity]())
        guard let model = try? entity.mapToDomain() else {
            XCTFail("Domain Model Conversion Failed")
            return
        }
        XCTAssertEqual(model.offset, 0)
        XCTAssertEqual(model.limit, 20)
    }

    func testCharacterListEntityInvalidOffset() {
        let entity = CharacterListEntity(offset: nil,
                                         limit: 20,
                                         total: 1111,
                                         results: [CharactersEntity]())

        XCTAssertThrowsError(try entity.mapToDomain())
    }

    func testCharacterListEntityInvalidLimit() {
        let entity = CharacterListEntity(offset: 0,
                                         limit: nil,
                                         total: 1111,
                                         results: [CharactersEntity]())
        XCTAssertThrowsError(try entity.mapToDomain())
    }

    func testCharacterListEntityInvalidTotal() {
        let entity = CharacterListEntity(offset: 0,
                                         limit: 20,
                                         total: nil,
                                         results: [CharactersEntity]())
        XCTAssertThrowsError(try entity.mapToDomain())
    }

    func testCharacterListEntityInvalidResult() {
        let entity = CharacterListEntity(offset: 0,
                                         limit: 20,
                                         total: 1111,
                                         results: nil)
        XCTAssertThrowsError(try entity.mapToDomain())
    }
}
