//
//  HomeViewController.swift
//  Pokemoni
//
//  Created by Tomislav Tomic on 01.08.2021..
//

import Alamofire
import Kingfisher
import SnapKit
import UIKit

class HomeViewController: UIViewController {
    
    let pokeLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello there! Welcome to the world of Pokémon! My name is Oak! People call me the Pokémon Prof! This world is inhabited by creatures called Pokémon! For some people, Pokémon are pets. Other use them for fights. Myself… I study Pokémon as a profession. Pokémon Around The World Wait For You!"
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = UIFont(name: "Quicksand-Medium", size: 22)
        label.textColor = .white
        label.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
        return label
    }()
    
    let pokeDex: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dex")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let oakImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "oak")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back")
        image.contentMode = .scaleAspectFill
        image.layer.opacity = 0.1
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    func setUI() {
        view.backgroundColor = .white
        view.addSubview(backImage)
        view.addSubview(pokeDex)
        view.addSubview(oakImage)
        view.addSubview(pokeLabel)
        setConstraints()
    }
    
    func setConstraints() {
        
        pokeDex.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.height.equalTo(100)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
        }
        
        oakImage.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.height.equalTo(150)
            make.top.equalTo(pokeDex.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
        }
        
        pokeLabel.snp.makeConstraints { make in
            make.top.equalTo(oakImage.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        backImage.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalTo(view)
        }
    }
}
