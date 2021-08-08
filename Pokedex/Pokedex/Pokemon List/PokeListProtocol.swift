//
//  PokemonListImpl.swift
//  Pokedex
//
//  Created by Tomislav Tomic on 30.07.2021..
//

import Foundation

protocol PokeListVM: AnyObject {
    var reloadDelegate: ReloadTableViewDelegate? { get set }
    var pokemonList: [PokemonSingle] { get set }
    
    func getPokemon()
    func pokemonDetail(url: String)
}

protocol ReloadTableViewDelegate: AnyObject {
    func reloadTableView()
}
