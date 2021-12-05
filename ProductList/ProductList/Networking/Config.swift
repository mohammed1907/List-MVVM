//
//  Config.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import Foundation

struct Config {
    static let baseURL: String = "https://fakestoreapi.com/"

    struct EndpointPath {
        static let getProducts = "products"
    }
}
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
    case form = "application/x-www-form-urlencoded"
}
