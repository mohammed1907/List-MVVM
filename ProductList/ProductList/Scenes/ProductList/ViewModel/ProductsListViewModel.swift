//
//  ProductsListViewModel.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import Foundation

class ProductsListViewModel {
    let apiService: ProductService

    var products: [ProductData] = [ProductData]() {
        didSet {
            self.processFetchedProducts(products: products)
        }
    }
    private var cellViewModels: [ProductCellViewModel] = [ProductCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }

    // callback for interfaces
    var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    var numberOfCells: Int {
        return cellViewModels.count
    }
    var isAllowSegue: Bool = false
    var selectedPhoto: ProductCellViewModel?

    var reloadTableViewClosure: (() -> Void)?
    var showAlertClosure: (() -> Void)?
    var updateLoadingStatus: (() -> Void)?

    init( apiService: ProductService = ProductServiceImpl()) {
        self.apiService = apiService
    }
    func initFetch() {
        state = .loading
        apiService.getProducts {[weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
             self.products = data
              self.state = .populated
            case .failure(let error):
                self.state = .error
                self.alertMessage = error.errorDescription
                    return
            }

        }
    }
    private func processFetchedProducts( products: [ProductData] ) {
        self.cellViewModels = products.compactMap { ProductCellViewModel(data: $0) }
    }
    func getCellViewModel( at indexPath: IndexPath ) -> ProductCellViewModel {
        return cellViewModels[indexPath.row]
    }
}
