struct CharactersEntity: Codable {
    let id: Int?
    let name: String?
    let thumbnail: CharactersThumbnailEntity?

    func mapToDomain() throws -> CharactersModel {
        guard let id = id else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid id")
            throw EncodingError.invalidValue(id ?? 0, error)
        }
        guard let name = name else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid name")
            throw EncodingError.invalidValue(name ?? 0, error)
        }
        return CharactersModel(id: id, name: name, thumbnail: thumbnail?.mapToDomain())
    }
}
