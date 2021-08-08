//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Tomislav Tomic on 30.07.2021..
//

import Foundation
import Alamofire

class PokeListViewModel: PokeListVM {
    
    var reloadDelegate: ReloadTableViewDelegate?
    var pokemonList: [PokemonSingle] = []
    
    func getPokemon() {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("WRONG URL")
            return
        }
        
        AF.request(url).responseDecodable(of: PokeList.self, decoder: JSONDecoder()) { response in
            guard let safeResponse = response.value else {
                return
            }
            
            for item in safeResponse.results {
                self.pokemonDetail(url: item.url)
            }
        }
    }
    
    func pokemonDetail(url: String) {
        
        guard let pokeUrl = URL(string: url) else {
            print("Failed to load image URL")
            return
        }
        
        AF.request(pokeUrl).responseDecodable(of: PokemonSingle.self, decoder: JSONDecoder()) { response in
            
            guard let safeResponse = response.value else {
                return
            }
            
            self.pokemonList.append(safeResponse)
            self.reloadDelegate?.reloadTableView()
        }
    }
}
