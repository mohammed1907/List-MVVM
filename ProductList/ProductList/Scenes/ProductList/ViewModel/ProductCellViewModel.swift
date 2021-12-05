//
//  ProductViewModel.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import Foundation

struct ProductCellViewModel {
    let titleText: String
    let price: Double
    let imageUrl: String
    let category: String
    init(data: ProductData) {
        self.titleText = data.title ?? ""
        self.price = data.price ?? 0
        self.imageUrl = data.image ?? ""
        self.category = data.category ?? ""
    }
}
