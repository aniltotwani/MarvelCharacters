import Alamofire
protocol CharacterServiceProviderContract {
    typealias CharacterListCompletion = (_ result: Result<CharacterListModel, UseCaseError>) -> Void
    typealias CharacterDetailsCompletion = (_ result: Result<CharacterDetailsModel, UseCaseError>) -> Void

    func getCharacterList(requestModel: CharacterListRequestModel, completion: @escaping CharacterListCompletion)
    func getCharacterDetails(characterID: Int, completion: @escaping CharacterDetailsCompletion)
}
