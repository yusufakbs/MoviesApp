//
//  ViewController.swift
//  MoviesApp
//
//  Created by Yusuf Akbaş on 29.12.2023.
//

import UIKit

class HomePage: UIViewController {
    
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var moviesList = [Movies]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        let m1 = Movies(id: 1, name: "Django", image: "django", price: 24)
        let m2 = Movies(id: 2, name: "Interstellar", image: "interstellar", price: 32)
        let m3 = Movies(id: 3, name: "Inception", image: "inception", price: 16)
        let m4 = Movies(id: 4, name: "The Hateful Eight", image: "thehatefuleight", price: 28)
        let m5 = Movies(id: 5, name: "The Pianist", image: "thepianist", price: 18)
        let m6 = Movies(id: 6, name: "Anadoluda", image: "anadoluda", price: 10)
        moviesList.append(m1)
        moviesList.append(m2)
        moviesList.append(m3)
        moviesList.append(m4)
        moviesList.append(m5)
        moviesList.append(m6)
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        // 10 X 10 X 10
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.6)
        
        moviesCollectionView.collectionViewLayout = design
        
    }
}

extension HomePage:UICollectionViewDelegate, UICollectionViewDataSource, CellProtocol{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = moviesList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as! MoviesCell
        cell.imageViewMovie.image = UIImage(named: movie.image!)
        cell.labelPrice.text = "\(movie.price!)"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let movie = sender as? Movies {
                let toGoVC = segue.destination as! PageDetails
                toGoVC.movie = movie
            }
        }
    }
    
    func addToCartClick(indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        print("\(movie.name!) added to cart")
    }
    
}

