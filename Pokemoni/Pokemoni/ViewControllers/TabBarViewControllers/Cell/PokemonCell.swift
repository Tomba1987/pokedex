//
//  PokemonCell.swift
//  Pokemoni
//
//  Created by Tomislav Tomic on 31.07.2021..
//

import Kingfisher
import SnapKit
import UIKit

class PokemonCell: UITableViewCell {
    
    static let identifier = "PokemonCell"
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Quicksand-Bold", size: 30)
        return label
    }()
    
    var myImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.clipsToBounds = true
        return myImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemTeal
        contentView.addSubview(myImageView)
        contentView.addSubview(nameLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(pokeItem: PokemonSingle) {
        nameLabel.text = pokeItem.name.capitalized
        if let url = URL(string: pokeItem.sprites.front) {
            myImageView.kf.setImage(with: url, options: [.cacheOriginalImage])
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        myImageView.image = nil
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCellConstraints()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
    }
    
    func setCellConstraints() {
        
        myImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20)
            make.height.width.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView).offset(50)
            make.centerY.equalTo(contentView)
        }
        
    }
}
