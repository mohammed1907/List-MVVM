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
    func test_loading_state_when_fetching() {
        // Given
        var state: State = .empty
        let expect = XCTestExpectation(description: "Loading state updated to populated")
        sut.updateLoadingStatus = { [weak sut] in
            state = sut!.state
            expect.fulfill()
        }
        // when fetching
        sut.initFetch()
        // Assert
        XCTAssertEqual(state, State.loading)
        wait(for: [expect], timeout: 1.0)
    }
}
