//
//  ProductCellTests.swift
//  ProductListTests
//
//  Created by Farghaly on 06/12/2021.
//

import XCTest
@testable import ProductList

class ProductCellTests: XCTestCase {
    var sut: ProductCellViewModel!
    let product =  ProductData(id: 1, title: "farghaly", price: 120.9, welcomeDescription: "hello", category: "mens", image: "https//image", rating: Rating(rate: 3.5, count: 10))

    override func setUpWithError() throws {
        super.setUp()
        sut = ProductCellViewModel(data: product)
    }
    override func tearDownWithError() throws {
        super.tearDown()
        sut = nil
    }

   

    func test_title_equal_prodTitle() throws {
        XCTAssertEqual(sut.titleText, "farghaly")
    }

    func test_prodAvatar_equal_prodAvatar() throws {
        XCTAssertEqual(sut.imageUrl, "https//image")
    }

    func test_productPrice_equal_prodPrice() throws {
        XCTAssertEqual(sut.price, 120.9)
    }

    

}
