//
//  Model.swift
//  Pokemoni
//
//  Created by Tomislav Tomic on 30.07.2021..
//

import Foundation

// LISTA 151-OG POKEMONA I NJEGOV URL
struct PokeList: Codable {
    var results: [Pokemon]
}

struct Pokemon: Codable {
    var name: String
    var url: String
}



// DETALJI POKEMONA, IME/ID/SLIKA
struct PokemonSingle: Codable {
    var id: Int
    var name: String
    var weight: Int
    var height: Int
    var sprites: Other
    var types: [Types]
}

struct Types: Codable {
    var type: Type
}

struct Type: Codable {
    var name: String
}

struct Other: Codable {
    var front: String
    var other: Artwork
    
    enum CodingKeys: String, CodingKey {
        case front = "front_default"
        case other
    }
}

struct Artwork: Codable {
    var artwork: FrontImage
    
    
    enum CodingKeys: String, CodingKey {
        case artwork = "official-artwork"
    }
}

struct FrontImage: Codable {
    var frontImage: String
    
    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
    }
}

// POKEMON SPECIES
struct PokemonSpecies: Codable {
    var evolvesFrom: Evolution?
    var habitat: Habitat
    var description: [Description]
    
    enum CodingKeys: String, CodingKey {
        case evolvesFrom = "evolves_from_species"
        case habitat
        case description = "flavor_text_entries"
    }
}

struct Description: Codable {
    var flavor_text: String
}

struct Evolution: Codable {
    var name: String
}

struct Habitat: Codable {
    var name: String
}
