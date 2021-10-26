struct CharacterDetailsEntity: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: CharactersThumbnailEntity?

    func mapToDomain() throws -> CharacterDetailsModel {
        guard let id = id else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid id")
            throw EncodingError.invalidValue(id ?? 0, error)
        }
        guard let name = name else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid name")
            throw EncodingError.invalidValue(name ?? "", error)
        }

        guard let description = description else {
            let error = EncodingError.Context(codingPath: [],
                                              debugDescription: "Invalid description")
            throw EncodingError.invalidValue(description ?? "", error)
        }
        return CharacterDetailsModel(id: id,
                                     name: name,
                                     description: description,
                                     thumbnail: thumbnail?.mapToDomain())
    }
}
