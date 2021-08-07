//
//  FavoriteVC.swift
//  Pokemoni
//
//  Created by Tomislav Tomic on 06.08.2021..
//

import UIKit
import SnapKit

class FavoriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokemons: [String] = UserDefaults.standard.stringArray(forKey: "pokemon") ?? ["1", "2", "3"]
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.backgroundColor = .systemTeal
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setConstraints()
        
        //tableView.reloadData()
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "Quicksand-SemiBold", size: 30)
        cell.textLabel?.textColor = .red
        cell.textLabel?.layer.cornerRadius = 30
        cell.textLabel?.layer.borderWidth = 1
        cell.textLabel?.backgroundColor = .white
        cell.textLabel?.clipsToBounds = true
        cell.textLabel?.text = self.pokemons[indexPath.row].uppercased()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.pokemons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.set(self.pokemons, forKey: "pokemon")
        }
    }
}
