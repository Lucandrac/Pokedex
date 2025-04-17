//
//  PokemonGetter.swift
//  Pokedex
//
//  Created by Stagiaire on 17/04/2025.
//

import Foundation
import Combine

class PokemonGetter: ObservableObject {
    var didChange = PassthroughSubject<[Pokemon], Never>()
    
    @Published var pokemons:  [Pokemon] = [] {
        didSet{
            didChange.send(pokemons)
        }
    }
    
    func getFromAPI(){
        let urlString = "https://tyradex.app/api/v1/pokemon"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (d, r, e) in
            if let error = e {
                print("here is error")
                print(error.localizedDescription) //recup message d'erreur
            }
            
            if let data = d {
                do{
                    let result: [Pokemon] = try JSONDecoder().decode([Pokemon].self, from: data)
                    DispatchQueue.main.sync{
                        self.pokemons = Array(result.prefix(100))
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}


