//
//  DetailPokemonView.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import SwiftUI

struct DetailPokemonView: View {
    
    var pokemon:Pokemon
    
    @ObservedObject var imageLoader = LoadImage()
    
    var body: some View {
        VStack{
            Spacer(minLength: 80)
            HStack{
                if imageLoader.image != nil {
                    Image(uiImage: imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170)
                        .clipped()
            }
            Spacer()
                VStack(alignment: .trailing){
                    Text(pokemon.name.fr)
                        .font(.title3)
                        .padding(.bottom, 45)
                    Text("Categorie : \(pokemon.category)")
                        .font(.subheadline)
                    Text("Génération :\(pokemon.generation)")
                    Text("Poids : \(String(describing: pokemon.weight))")
                }
            }
            Spacer(minLength: 25)
            List(pokemon.types, id: \.name){ type in
                Text(type.name)
                    .frame(minHeight: 50, idealHeight: 100, maxHeight: .greatestFiniteMagnitude, alignment: .top)
            }
            

        }
        .padding(10)
        .onAppear(){
            imageLoader.load(pokemon.sprites.regular)
        }
    }
}

//#Preview {
//    let pokemon:Pokemon = Pokemon(pokedexID: 1, generation: 1, category: "Pokémon feu", name: Name(fr: "Salamèche", en: "Charmander", jp: "e sais pas"), sprites: Sprites(regular: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/0/regular.png", shiny: nil, gmax: nil), types: nil, talents: nil, stats: nil, resistances: nil, evolution: nil, height: nil, weight: nil, eggGroups: nil, sexe: nil, catchRate: nil, level100: nil, formes: nil)
//    return DetailPokemonView(pokemon: pokemon)
//}
