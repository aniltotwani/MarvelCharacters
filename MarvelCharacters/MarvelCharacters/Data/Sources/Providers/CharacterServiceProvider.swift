import Foundation

final class CharacterServiceProvider: CharacterServiceProviderContract {
    private var serviceRequest : NetworkServiceContract!

    init(serviceRequest: NetworkServiceContract = NetworkService()) {
        self.serviceRequest = serviceRequest
    }

    func getCharacterList(requestModel: CharacterListRequestModel, completion: @escaping CharacterListCompletion) {
        let requestEntity = CharacterListRequestEntity(model: requestModel)
        serviceRequest.requestService(service: CharacterService.characterList(entity: requestEntity) ) { response in
            switch response {
            case let .success(data):
                guard let data = data as? Data else {
                    return
                }
                completion(self.getCharacterList(for: data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func getCharacterDetails(characterID: Int, completion: @escaping CharacterDetailsCompletion) {
        serviceRequest.requestService(service: CharacterService.characterDetails(characterID: characterID)) { response in
            switch response {
            case let .success(data):
                guard let data = data as? Data else {
                    return
                }
                completion(self.getCharacterDetails(for: data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
