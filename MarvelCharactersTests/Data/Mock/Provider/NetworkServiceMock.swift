import Alamofire
import Foundation
@testable import MarvelCharacters

typealias ResponseHandler = Result<Any?, UseCaseError>
final class NetworkServiceMock: NetworkServiceContract {

    var responseHandler: ResponseHandler

    init(responseHandler: ResponseHandler) {
        self.responseHandler = responseHandler
    }

    func requestService(service: CharacterService, completion: @escaping (Result<Any?, UseCaseError>) -> Void) {
        completion(responseHandler)
    }
}
