//
//  FilmsView.swift
//  Generic request
//
//  Created by PROGRAMAR on 10/05/21.
//

import SwiftUI

struct FilmsView: View {
    @StateObject var filmsVM : FilmsViewModel
    
    
    init() {
        self._filmsVM = StateObject(wrappedValue: FilmsViewModel())
    }
    
    var body: some View {
        LazyVStack{
            ScrollView{
                
                ForEach(filmsVM.films , id: \.id ) { film in
                    Text(film.title)
                }
                
            }
        }
        .onAppear {
            filmsVM.getFilms()
        }
    }
    
}

struct FilmsView_Previews: PreviewProvider {
    static var previews: some View {
        FilmsView()
    }
}
