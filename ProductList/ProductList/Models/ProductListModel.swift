//
//  ProductListModel.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import Foundation

// MARK: - WelcomeElement
struct ProductData: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let welcomeDescription: String?
    let category: String?
    let image: String?
    let rating: Rating?

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case welcomeDescription = "description"
        case category, image, rating
    }
}
// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?
}
