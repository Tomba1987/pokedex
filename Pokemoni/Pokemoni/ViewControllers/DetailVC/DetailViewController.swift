//
//  DetailViewController.swift
//  Pokemoni
//
//  Created by Tomislav Tomic on 31.07.2021..
//

import Alamofire
import Kingfisher
import SnapKit
import UIKit

class DetailViewController: UIViewController {
    
    var id: Int = 0
    var pokemon: [PokemonSingle] = []
    let configuration = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
    
    let backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back")
        image.contentMode = .scaleAspectFill
        image.layer.opacity = 0.1
        return image
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont(name: "Quicksand-Bold", size: 30)
        return label
    }()
    
    var picture: UIImageView = {
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.clipsToBounds = true
        return myImageView
    }()
    
    var buttonFav: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        return button
    }()
    
    var heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Quicksand-SemiBold", size: 25)
        return label
    }()
    
    var weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Quicksand-SemiBold", size: 25)
        return label
    }()
    
    let typeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var habitatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Quicksand-SemiBold", size: 25)
        return label
    }()
    
    var evolutionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Quicksand-SemiBold", size: 25)
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.layer.cornerRadius = 20
        scrollView.backgroundColor = .systemTeal
        return scrollView
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Quicksand-SemiBold", size: 25)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = .white
        view.addSubview(backImage)
        view.addSubview(scrollView)
        view.addSubview(picture)
        view.addSubview(backButton)
        view.addSubview(name)
        
        scrollView.addSubview(heightLabel)
        scrollView.addSubview(weightLabel)
        scrollView.addSubview(typeImage)
        scrollView.addSubview(habitatLabel)
        scrollView.addSubview(evolutionLabel)
        scrollView.addSubview(descriptionLabel)
        
        backButton.setImage(UIImage(systemName: "arrow.backward", withConfiguration: configuration), for: .normal)
        backButton.addTarget(self, action: #selector(getBack), for: .touchUpInside)
        
        setConstraints()
        setType()
        getPokemonSpecies()
    }
    
    func setConstraints() {
        backImage.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalTo(view)
        }
        
        picture.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.top.equalTo(view).offset(50)
            make.centerX.equalTo(view)
            make.height.equalTo(view).dividedBy(3)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        name.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(picture.snp.bottom)
        }
        
        scrollView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(view).dividedBy(2.5)
            make.top.equalTo(name.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
        
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(10)
            make.leading.equalTo(scrollView).offset(10)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            
        }
        
        typeImage.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.centerX.equalTo(scrollView)
            make.top.equalTo(heightLabel.snp.bottom).offset(20)
        }
        
        habitatLabel.snp.makeConstraints { make in
            make.top.equalTo(typeImage.snp.bottom).offset(20)
            make.centerX.equalTo(scrollView)
        }
        
        evolutionLabel.snp.makeConstraints { make in
            make.top.equalTo(habitatLabel.snp.bottom).offset(20)
            make.centerX.equalTo(scrollView)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(scrollView).dividedBy(1)
            make.bottom.equalTo(scrollView).offset(-10)
            make.top.equalTo(evolutionLabel.snp.bottom).offset(20)
        }
        
    }
    
    func setType() {
        
        switch typeLabel.text {
        case "bug":
            typeImage.image = UIImage(named: "bug")
        case "dark":
            typeImage.image = UIImage(named: "dark")
        case "dragon":
            typeImage.image = UIImage(named: "dragon")
        case "electric":
            typeImage.image = UIImage(named: "electric")
        case "fairy":
            typeImage.image = UIImage(named: "fairy")
        case "fighting":
            typeImage.image = UIImage(named: "fighting")
        case "fire":
            typeImage.image = UIImage(named: "fire")
        case "flying":
            typeImage.image = UIImage(named: "flying")
        case "ghost":
            typeImage.image = UIImage(named: "ghost")
        case "grass":
            typeImage.image = UIImage(named: "grass")
        case "ground":
            typeImage.image = UIImage(named: "ground")
        case "ice":
            typeImage.image = UIImage(named: "ice")
        case "normal":
            typeImage.image = UIImage(named: "normal")
        case "poison":
            typeImage.image = UIImage(named: "poison")
        case "psychic":
            typeImage.image = UIImage(named: "psychic")
        case "rock":
            typeImage.image = UIImage(named: "rock")
        case "steel":
            typeImage.image = UIImage(named: "steel")
        case "water":
            typeImage.image = UIImage(named: "water")
        default:
            typeImage.image = UIImage(systemName: "personalhotspot")
        }
        
    }
    
    func getPokemonSpecies() {
        guard let pokeUrl = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(self.id)/") else {
            print("Failed to load species URL")
            return
        }
        
        AF.request(pokeUrl).responseDecodable(of: PokemonSpecies.self, decoder: JSONDecoder()) { response in
            guard let safeResponse = response.value else {
                return
            }
            
            self.habitatLabel.text = "Habitat: \(safeResponse.habitat.name.capitalized)"
            self.evolutionLabel.text = "Evolves from: \(safeResponse.evolvesFrom?.name.capitalized ?? "N/A")"
            let cleanDescription = safeResponse.description[0].flavor_text
            self.descriptionLabel.text = cleanDescription.components(separatedBy: .newlines).joined(separator: " ")
        }
    }
    
    @objc func getBack() {
        dismiss(animated: true)
    }
}

