//
//  HomePageViewModel.swift
//  MoviesApp
//
//  Created by Yusuf Akbaş on 8.01.2024.
//

import Foundation
import RxSwift

class HomePageViewModel {
    var mRepo = MoviesDaoRepository()
    var moviesList = BehaviorSubject<[Movies]>(value: [Movies]())
    
    init() {
        moviesList = mRepo.moviesList
        moviesLoad()
    }
     
    func moviesLoad(){
        mRepo.moviesLoad()
    }
}
