//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Tomislav Tomic on 30.07.2021..
//

import Alamofire
import Kingfisher
import SnapKit
import UIKit

class PokeListViewController: UIViewController {
    
    var viewModel: PokeListViewModel
    
    init(viewModel: PokeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        setViewModel()
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
        self.viewModel.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell else {
            return UITableViewCell()
        }
        
        let pokemon = viewModel.pokemonList
        cell.configure(pokeItem: pokemon[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        
        let detailVC = DetailViewController()
        let pokemon = viewModel.pokemonList[indexPath.row]
        
        detailVC.name.text = pokemon.name
        detailVC.heightLabel.text = "Height: \(String(pokemon.height))"
        detailVC.weightLabel.text = "Weight: \(String(pokemon.weight))"
        detailVC.typeLabel.text = pokemon.types[0].type.name
        detailVC.id = pokemon.id
        
        if let url = URL(string: pokemon.sprites.other.artwork.frontImage) {
            detailVC.picture.kf.setImage(with: url, options: [.cacheOriginalImage])
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
    }
}

extension PokeListViewController: ReloadTableViewDelegate {
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func setViewModel() {
        viewModel.getPokemon()
        viewModel.reloadDelegate = self
    }
}
