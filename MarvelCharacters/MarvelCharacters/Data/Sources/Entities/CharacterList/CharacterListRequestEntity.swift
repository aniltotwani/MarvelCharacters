struct CharacterListRequestEntity {
    let offset: Int
    let limit: Int

    init(model: CharacterListRequestModel) {
        offset = model.offset
        limit = model.limit
    }
}
