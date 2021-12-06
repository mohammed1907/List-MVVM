//
//  UIImageView + Extension.swift
//  ProductList
//
//  Created by Farghaly on 05/12/2021.
//

import UIKit

extension UIImageView {
    func setImage(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }

        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = center
        addSubview(activityIndicator)
        activityIndicator.startAnimating()

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                }
                return
            }
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                    activityIndicator.stopAnimating()
                }
            }
        }
    }
}
