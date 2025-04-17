//
//  JsonResponse.swift
//  Pokedex
//
//  Created by Stagiaire on 17/04/2025.
//

import Foundation

struct Pokemon: Decodable {
    let pokedexID: Int
    let generation: Int
    let category: String
    let name: Name
    let sprites: Sprites
    let types: [String]?
    let talents: [String]?
    let stats: [String: Int]?
    let resistances: [String]?
    let evolution: [String]?
    let height: Double?
    let weight: Double?
    let eggGroups: [String]?
    let sexe: String?
    let catchRate: Int?
    let level100: [String: Int]?
    let formes: [String]?
}

struct Name: Decodable {
    let fr: String
    let en: String
    let jp: String
}

struct Sprites: Decodable {
    let regular: String?
    let shiny: String?
    let gmax: String?
}

