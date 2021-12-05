//
//  NetworkError.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import Foundation

enum NetworkError: Error {
    case requestTimeout
    case internalServerError
    case clientErrors
    case parsingError
    case unknownError
    case notFound
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .requestTimeout:
            return "Request timeout"
        case .internalServerError:
            return "Internal Server error"
        case .clientErrors:
            return "Client error responses"
        case .parsingError:
            return "Error parsing the request"
        case .unknownError:
            return "Something went wrong, please try again later"
        case .notFound:
            return "We cannot find this page, please try again"
        }
    }
}
