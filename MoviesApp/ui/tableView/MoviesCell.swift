//
//  moviesCell.swift
//  MoviesApp
//
//  Created by Yusuf Akbaş on 29.12.2023.
//

import UIKit

protocol CellProtocol {
    func addToCartClick(indexPath:IndexPath)
}

class MoviesCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    
    var cellProtocol : CellProtocol?
    var indexPath:IndexPath?
    
    @IBAction func buttonAddToCart(_ sender: Any) {
        cellProtocol?.addToCartClick(indexPath: indexPath!)
    }
    
    
}
