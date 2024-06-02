//
//  CharacterView.swift
//  ChineseCharacters
//
//  Created by mac on 01.06.2024.
//

import UIKit

class CharacterView: UIView {
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 100.0)
        label.text = "你好"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let readingLabel: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36.0)
        label.text = "nihao"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let characterReadingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.backgroundColor = UIColor.clear.cgColor
        stackView.spacing = 30
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let radicalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.backgroundColor = .clear
        label.textColor = .white
        label.text = "人"
        return label
    }()
    private let strokesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.backgroundColor = .clear
        label.textColor = .white
        label.text = "4"
        return label
    }()
    
    private let radicalStrokesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.layer.backgroundColor = UIColor.clear.cgColor
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let strokesString: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "strokes"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let radicalString: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "radical"
        return label
    }()
    private let stringsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.isHidden = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUISubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUI(view:UIView) {
        let screenWindth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        self.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(self)
        
        widthAnchor.constraint(equalToConstant: screenWindth-70).isActive=true
        heightAnchor.constraint(equalToConstant: screenHeight/2).isActive=true
        
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
    }
    
    func setUISubViews() {
        
        layer.cornerRadius = 20
        layer.borderWidth = 3
        layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        
        backgroundColor = .clear
        layer.cornerRadius = 20
        layer.borderWidth = 3
        layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        
        characterReadingStackView.addArrangedSubview(characterLabel)
        characterReadingStackView.addArrangedSubview(readingLabel)
        radicalStrokesStackView.addArrangedSubview(radicalLabel)
        radicalStrokesStackView.addArrangedSubview(strokesLabel)
        characterReadingStackView.addArrangedSubview(radicalStrokesStackView)
        stringsStackView.addArrangedSubview(radicalString)
        stringsStackView.addArrangedSubview(strokesString)
        characterReadingStackView.addArrangedSubview(stringsStackView)
        addSubview(characterReadingStackView)
        
        //Constraints
        NSLayoutConstraint.activate([
            characterReadingStackView.widthAnchor.constraint(equalTo: widthAnchor,constant: -30),
            characterReadingStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterReadingStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
    
    
    
}
