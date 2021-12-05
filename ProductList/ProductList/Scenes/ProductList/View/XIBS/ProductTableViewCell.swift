//
//  ProductTableViewCell.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    var productCellViewModel : ProductCellViewModel? {
        didSet {
            nameLabel.text = productCellViewModel?.titleText
            categoryLabel.text = productCellViewModel?.category
            mainImageView?.setImage(imageURL: productCellViewModel?.imageUrl ?? "" )
            priceLabel.text = "\(productCellViewModel?.price ?? 0)"
        }
    }
}
