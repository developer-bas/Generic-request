//
//  FilmsViewModel.swift
//  Generic request
//
//  Created by PROGRAMAR on 10/05/21.
//

import Foundation

class FilmsViewModel : ObservableObject {
    
    @Published var films = [Film]()
    @Published var error = ""
    
    
    func getFilms(){
        APIManager.shared.genericRequest(Router.getFils) { (resp: Result<Films,Error> ) in
            
            switch resp {
            case .success(let films) :
                self.films = films.all
                
            case .failure(let error):
                self.error = error.localizedDescription
            }
            
        }
    }
    
}
