//
//  ViewController.swift
//  ChineseCharacters
//
//  Created by mac on 13.10.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var character: String?
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 120.0)
        label.text = ""
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
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     private let characterView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
         view.layer.cornerRadius = 20
         view.layer.borderWidth = 3
         view.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
         view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let radicalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()
    private let strokesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()
    private let characterDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.layer.backgroundColor = UIColor.black.cgColor
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    //MARK: TODO
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
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 20
        button.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        button.setTitle("Quiz", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showQuizVC), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setUIElements()
        alamofireGetMethod()
    }
    override func viewDidAppear(_ animated: Bool) {
        animateLayout()
    }
    
    //MARK: CreateUI
    func setUIElements() {
        characterView.addSubview(characterLabel)
        characterView.addSubview(readingLabel)
        stringsStackView.addArrangedSubview(radicalString)
        stringsStackView.addArrangedSubview(strokesString)
        characterView.addSubview(stringsStackView)
        characterDataStackView.addArrangedSubview(radicalLabel)
        characterDataStackView.addArrangedSubview(strokesLabel)
        characterView.addSubview(characterDataStackView)
        self.view.addSubview(button)
        self.view.addSubview(characterView)
        
        //setConstraints
        let screenWindth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let viewWindth = screenWindth/1.5
        let viewHeight = screenHeight/2.5
        
        NSLayoutConstraint.activate([
            
            characterView.widthAnchor.constraint(equalToConstant: viewWindth),
            characterView.heightAnchor.constraint(equalToConstant: viewHeight),
            characterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            characterLabel.widthAnchor.constraint(equalToConstant: 200),
            characterLabel.heightAnchor.constraint(equalToConstant: 150),
            characterLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            characterLabel.topAnchor.constraint(equalTo: characterView.topAnchor, constant: 10),
            
            readingLabel.widthAnchor.constraint(equalToConstant: 200),
            readingLabel.heightAnchor.constraint(equalToConstant: 38),
            readingLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            readingLabel.topAnchor.constraint(equalTo: characterLabel.bottomAnchor),
            
            stringsStackView.widthAnchor.constraint(equalToConstant: viewWindth),
            stringsStackView.heightAnchor.constraint(equalToConstant: 40),
            stringsStackView.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            stringsStackView.bottomAnchor.constraint(equalTo: characterView.bottomAnchor),
            
            characterDataStackView.widthAnchor.constraint(equalToConstant: viewWindth),
            characterDataStackView.heightAnchor.constraint(equalToConstant: 80),
            characterDataStackView.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            characterDataStackView.bottomAnchor.constraint(equalTo: stringsStackView.topAnchor),
            
            button.widthAnchor.constraint(equalToConstant: viewWindth),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: characterDataStackView.bottomAnchor,constant: 50),
            
             ])
    }
    func alamofireGetMethod() {
        guard let character = character else {return}
        NetworkingManager.shared.alamofireGetMethod(character: character) { character in
            self.characterLabel.text = character.char
            self.radicalLabel.text = character.radical
            self.strokesLabel.text = character.totalstrokes
            self.readingLabel.text = character.readings?.mandarinpinyin?.first
        }
    }
    @objc func showQuizVC() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.button.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            self.button.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { bool in
            let destinationVC = StrokesViewController()
            destinationVC.character = self.character
            self.navigationController?.pushViewController(destinationVC, animated: true)
            }
    }
    private func animateLayout() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            self.button.transform = CGAffineTransform(scaleX: 0.9 , y: 0.9)
        } completion: { bool in
            UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
                self.button.transform = CGAffineTransform(scaleX: 1 , y: 1)
            }
        }
    }
}


