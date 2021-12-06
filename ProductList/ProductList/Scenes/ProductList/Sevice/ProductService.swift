//
//  ProductService.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import Foundation

protocol ProductService {
    func getProducts(completion: @escaping (Result<[ProductData], NetworkError>) -> Void)
}

class ProductServiceImpl: ProductService {
    private let service = NetworkService()

    func getProducts(completion: @escaping (Result<[ProductData], NetworkError>) -> Void) {
        return service.fetchRequest(forRoute: .getProducts, completion: completion)
    }
}
