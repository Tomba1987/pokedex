//
//  FavoriteCell.swift
//  Pokedex
//
//  Created by Tomislav Tomic on 07.08.2021..
//

import UIKit
import SnapKit

class FavoriteCell: UITableViewCell {
    
    static let identifier = "FavoriteCell"
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Quicksand-Bold", size: 30)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemTeal
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(name: String) {
        nameLabel.text = name.capitalized
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCellConstraints()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
    }
    
    func setCellConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(contentView)
        }
    }
}
