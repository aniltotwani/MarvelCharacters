struct CharacterListEntity: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let results: [CharactersEntity]?

    func mapToDomain() throws -> CharacterListModel {
        guard let offset = offset else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid offset")
            throw EncodingError.invalidValue(offset ?? 0, error)
        }

        guard let limit = limit else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid limit")
            throw EncodingError.invalidValue(limit ?? 0, error)
        }

        guard let total = total else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid total")
            throw EncodingError.invalidValue(total ?? 0, error)
        }

        guard let items = results?.compactMap({ charactersList in
            return try? charactersList.mapToDomain()
        })  else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid results")
            throw EncodingError.invalidValue(results ?? [], error)
        }
        return CharacterListModel(offset: offset, limit: limit, total: total, items: items)
    }
}
