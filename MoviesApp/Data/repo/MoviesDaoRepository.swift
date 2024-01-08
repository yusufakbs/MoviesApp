//
//  MoviesDaoRepository.swift
//  MoviesApp
//
//  Created by Yusuf Akbaş on 8.01.2024.
//

import Foundation
import RxSwift

class MoviesDaoRepository {
    var moviesList = BehaviorSubject<[Movies]>(value: [Movies]())
    
    func moviesLoad(){
        var list = [Movies]()
        
        let m1 = Movies(id: 1, name: "Django", image: "django", price: 24)
        let m2 = Movies(id: 2, name: "Interstellar", image: "interstellar", price: 32)
        let m3 = Movies(id: 3, name: "Inception", image: "inception", price: 16)
        let m4 = Movies(id: 4, name: "The Hateful Eight", image: "thehatefuleight", price: 28)
        let m5 = Movies(id: 5, name: "The Pianist", image: "thepianist", price: 18)
        let m6 = Movies(id: 6, name: "Anadoluda", image: "anadoluda", price: 10)
        
        list.append(m1)
        list.append(m2)
        list.append(m3)
        list.append(m4)
        list.append(m5)
        list.append(m6)
        
        moviesList.onNext(list)
    }
}
