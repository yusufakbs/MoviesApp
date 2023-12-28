//
//  PageDetailsViewController.swift
//  MoviesApp
//
//  Created by Yusuf Akbaş on 29.12.2023.
//

import UIKit

class PageDetails: UIViewController {

    @IBOutlet weak var labelMovie: UILabel!
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!

    var movie : Movies?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let m = movie {
            labelMovie.text = m.name
            imageViewMovie.image = UIImage(named: m.image!)
            labelPrice.text = "\(m.price!)"
        }
        
    }
    
}
