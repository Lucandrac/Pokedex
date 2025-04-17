//
//  ContentView.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pokemonGetter = PokemonGetter()
    @State var search: String = ""
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Rechercher un pokémon", text: $search)
            }
            List(pokemonGetter.pokemons, id: \.pokedexID){ pokemon in
                if search.isEmpty {
                    CellView(pokemon: pokemon)
                } else if pokemon.name.fr.contains(search) {
                    CellView(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokédex")
            .onAppear(){
                self.pokemonGetter.getFromAPI()
            }
        }
    }
}

#Preview {
    ContentView()
}
