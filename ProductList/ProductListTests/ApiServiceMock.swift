//
//  ApiServiceMock.swift
//  ProductListTests
//
//  Created by Farghaly on 05/12/2021.
//

import Foundation
@testable import ProductList

class ApiServiceMock: ProductService {
    var isFetchDataCalled = false
    var completeData: [ProductData] = [ProductData]()
    var completeClosure: ((Result<[ProductData], NetworkError>) -> Void)!

    func getProducts(completion: @escaping (Result<[ProductData], NetworkError>) -> Void) {
        isFetchDataCalled = true
        completeClosure = completion
    }
}
