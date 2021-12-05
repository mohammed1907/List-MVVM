//
//  ProductListViewModelTest.swift
//  ProductListTests
//
//  Created by Farghaly on 05/12/2021.
//

import XCTest
@testable import ProductList

class ProductListViewModelTest: XCTestCase {
    var sut: ProductsListViewModel!
    var apiServiceMock: ApiServiceMock!
    let product =  ProductData(id: 1, title: "farghaly", price: 120.9, welcomeDescription: "hello", category: "mens", image: "https//image", rating: Rating(rate: 3.5, count: 10))
    
    override func setUp() {
        super.setUp()
        apiServiceMock = ApiServiceMock()
        sut = ProductsListViewModel(apiService: apiServiceMock)
    }
    
    override func tearDown() {
        sut = nil
        apiServiceMock = nil
        super.tearDown()
    }
    func test_fetch_product() {
        // Given
        apiServiceMock.completeData = [ProductData]()

        // When
        sut.initFetch()
    
        // Assert
        XCTAssert(apiServiceMock!.isFetchDataCalled)
    }
    
    func test_fetch_product_fail() {
        
        // Given a failed fetch with a certain failure
        let error = NetworkError.unknownError
        
        // When
        sut.initFetch()
        
        apiServiceMock.fetchFail(error: error )
        
        // Sut should display predefined error message
        XCTAssertEqual( sut.alertMessage, error.failureReason )
        
    }


}
