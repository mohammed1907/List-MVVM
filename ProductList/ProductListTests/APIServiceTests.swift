//

//  APIServiceTests.swift
//  APIServiceTests
//
//  Created by Farghaly on 05/12/2021.
//

import XCTest
@testable import ProductList

class APIServiceTests: XCTestCase {
    var sut: ProductServiceImpl?
    override func setUp() {
        super.setUp()
        sut = ProductServiceImpl()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_fetch_popular_photos() {

        // Given A apiservice
        let sut = self.sut!

        // When fetch popular photo
        let expect = XCTestExpectation(description: "callback")

        sut.getProducts {[weak self] result in
            guard let self = self else {
                return
            }
            expect.fulfill()
            switch result {
            case .success(let data):
                XCTAssertEqual(data.count, 20)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            self.wait(for: [expect], timeout: 3.1)
    }
}
}
