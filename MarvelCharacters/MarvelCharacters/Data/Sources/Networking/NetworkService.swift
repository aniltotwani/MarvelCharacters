import Foundation
import Alamofire

protocol NetworkServiceContract {
    func requestService(service: CharacterService, completion: @escaping (Result<Any?, UseCaseError>) -> Void)
}

final class NetworkService: NetworkServiceContract {
    func requestService(service: CharacterService, completion: @escaping (Result<Any?, UseCaseError>) -> Void) {
        AF.request(service.mainURL, method: service.method, parameters: service.parameters)
            .validate()
            .response { response in
            switch response.result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error.error()))
            }
        }
    }
}
