import Foundation
import Alamofire

struct CharacterListParams {
    typealias Completion = (_ result: Result<CharacterListModel, UseCaseError>) -> Void

    let requestModel: CharacterListRequestModel
    let completion: Completion

    init(requestModel: CharacterListRequestModel,
         completion: @escaping Completion) {
        self.requestModel = requestModel
        self.completion = completion
    }
}


protocol CharacterListUseCaseContract {
    func run(_ params: CharacterListParams)
}

final class CharacterListUseCase: CharacterListUseCaseContract {
    private let provider: CharacterServiceProviderContract

    init(provider: CharacterServiceProviderContract = CharacterServiceProvider()) {
        self.provider = provider
    }

    func run(_ params: CharacterListParams) {
        provider.getCharacterList(requestModel: params.requestModel, completion: params.completion)
    }
}
