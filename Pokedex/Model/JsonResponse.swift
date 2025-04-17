import Foundation

struct Pokemon: Decodable {
    let pokedexID: Int
    let generation: Int
    let category: String
    let name: Name
    let sprites: Sprites
    let types: [TypeElement]
    let talents: [Talent]
    let stats: Stats
    let resistances: [Resistance]
    let evolution: Evolution
    let height: String
    let weight: String
    let eggGroups: [String]
    let sexe: Sexe
    let catchRate: Int
    let level100: Int
    let formes: [String]?

    enum CodingKeys: String, CodingKey {
        case pokedexID = "pokedex_id"
        case generation
        case category
        case name
        case sprites
        case types
        case talents
        case stats
        case resistances
        case evolution
        case height
        case weight
        case eggGroups = "egg_groups"
        case sexe
        case catchRate = "catch_rate"
        case level100 = "level_100"
        case formes
    }
}

struct Name: Decodable {
    let fr: String
    let en: String
    let jp: String
}

struct Sprites: Decodable {
    let regular: String
    let shiny: String
    let gmax: String?
}

struct TypeElement: Decodable {
    let name: String
    let image: String
}

struct Talent: Decodable {
    let name: String
    let tc: Bool
}

struct Stats: Decodable {
    let hp: Int
    let atk: Int
    let def: Int
    let speAtk: Int
    let speDef: Int
    let vit: Int

    enum CodingKeys: String, CodingKey {
        case hp
        case atk
        case def
        case speAtk = "spe_atk"
        case speDef = "spe_def"
        case vit
    }
}

struct Resistance: Decodable {
    let name: String
    let multiplier: Double
}

struct Evolution: Decodable {
    let pre: EvolutionElement?
    let next: [EvolutionElement]
    let mega: EvolutionElement?
}

struct EvolutionElement: Decodable {
    let pokedexID: Int?
    let name: String?
    let condition: String?

    enum CodingKeys: String, CodingKey {
        case pokedexID = "pokedex_id"
        case name
        case condition
    }
}

struct Sexe: Decodable {
    let male: Double
    let female: Double
}
