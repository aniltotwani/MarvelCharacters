import Foundation
import Moya

enum UseCaseError: Error {
    case inValidURL
    case noResponse
    case generic(Error?)
}

extension MoyaError {
    func error() -> UseCaseError {
        switch self {
        case .underlying(let error, _):
            return .generic(error)
        case .parameterEncoding(_):
            return .inValidURL
        default:
            return .noResponse
        }
    }
}
