//
//  CellView.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import SwiftUI

struct CellView: View {
    
    var pokemon: Pokemon
    
    @ObservedObject var imageLoader = LoadImage()
    
    var body: some View {
        NavigationLink(destination: DetailPokemonView(pokemon: pokemon)) {
            HStack{
                //image si le lien existe
                
                if imageLoader.image != nil {
                    Image(uiImage: imageLoader.image!)
                        .resizable()
                        .frame(width: 55, height: 55, alignment: .center)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.purple, lineWidth: 2))
                }
                
                Spacer()
                VStack(alignment: .trailing) {
                    Text(pokemon.name.fr)
                        .font(.title2)
                        .foregroundColor(.brown)
                    Text ("Categorie : \(pokemon.category)")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                        .italic()
                }
            }
            .padding(5)
            .onAppear(){
                imageLoader.load(pokemon.sprites.regular ?? "images")
        }
        }
    }
}

#Preview {
    let pokemon:Pokemon = Pokemon(pokedexID: 1, generation: 1, category: "Pokémon feu", name: Name(fr: "Salamèche", en: "Charmander", jp: "e sais pas"), sprites: Sprites(regular: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/0/regular.png", shiny: nil, gmax: nil), types: nil, talents: nil, stats: nil, resistances: nil, evolution: nil, height: nil, weight: nil, eggGroups: nil, sexe: nil, catchRate: nil, level100: nil, formes: nil)
    return CellView(pokemon: pokemon)
}
