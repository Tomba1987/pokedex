//
//  ViewController.swift
//  Pokemoni
//
//  Created by Tomislav Tomic on 30.07.2021..
//

import Alamofire
import Kingfisher
import SnapKit
import UIKit

class PokeListViewController: UIViewController {
    
    var pokemonList: [PokemonSingle] = []
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let imagePokemon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableViewConstraints()
        getPokemon()
        
        
    }
    
    func setUI() {
        view.backgroundColor = .systemTeal
        view.addSubview(tableView)
        tableView.rowHeight = 150
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonCell.self, forCellReuseIdentifier: PokemonCell.identifier)
    }
    
    func setTableViewConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension PokeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.pokemonList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell else {
            return UITableViewCell()
        }
        
        cell.configure(pokeItem: pokemonList[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        
        let detailVC = DetailViewController()
        
        detailVC.name.text = pokemonList[indexPath.row].name.capitalized
        detailVC.heightLabel.text = "Height: \(String(pokemonList[indexPath.row].height))"
        detailVC.weightLabel.text = "Weight: \(String(pokemonList[indexPath.row].weight))"
        detailVC.typeLabel.text = pokemonList[indexPath.row].types[0].type.name
        detailVC.id = pokemonList[indexPath.row].id
        
        if let url = URL(string: pokemonList[indexPath.row].sprites.other.artwork.frontImage) {
            detailVC.picture.kf.setImage(with: url, options: [.cacheOriginalImage])
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
    }
    
    
}

extension PokeListViewController {
    
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
            self.tableView.reloadData()
        }
    }
}

