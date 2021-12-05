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
    var completeClosure: (([ProductData], NetworkError?) -> ())!
    func getProducts(completion: @escaping (Result<[ProductData], NetworkError>) -> ()) {
        isFetchDataCalled = true
    }
    func fetchSuccess() {
        completeClosure( completeData, nil )
    }

    func fetchFail(error: NetworkError?) {
        completeClosure( completeData, error )
    }

}
