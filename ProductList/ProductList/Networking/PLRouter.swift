//
//  PLRouter.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import Foundation

enum PLRouter {

    // MARK: - Endpoints
    case getProducts

    // MARK: - Properties
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getProducts:
            return Config.EndpointPath.getProducts
        }
    }

    var parameters: [String: Any]? {
        switch self {
        default:
            return nil

        }
    }

    // MARK: - Methods
    func asURLRequest() throws -> URLRequest {
        let endpointPath: String = "\(Config.baseURL)\(path)"
        var components = URLComponents(string: endpointPath)
        var urlRequest = URLRequest(url: (components?.url)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.url = components?.url

        return urlRequest
    }
}
