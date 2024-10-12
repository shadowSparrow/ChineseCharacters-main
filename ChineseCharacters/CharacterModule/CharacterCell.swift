//
//  CollectionViewCell.swift
//  ChineseCharacters
//
//  Created by mac on 25.10.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {
     lazy var characterLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 3
        self.layer.borderColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 0.5)
        self.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 20, alpha: 0.1)
        
        setUIElemets()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUIElemets() {
        self.addSubview(characterLabel)
        characterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        characterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
