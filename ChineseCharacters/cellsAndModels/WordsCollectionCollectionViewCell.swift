//
//  WordsCollectionCollectionViewCell.swift
//  ChineseCharacters
//
//  Created by mac on 20.05.2024.
//
import UIKit
import AVFoundation

class WordsCollectionViewCell: UICollectionViewCell {
    
    var word: Word?
    
    private let characterView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 20
        view.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        view.layer.borderWidth = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 20
        view.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        view.layer.borderWidth = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let wordLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 120)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pingYingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 70)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let translationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Play", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        button.layer.borderWidth = 3
        button.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    func setWord(word:Word){
        self.word = word
        self.wordLabel.text = word.name
        self.pingYingLabel.text=word.pingYing
        self.translationLabel.text=word.translation
        self.backgroundColor = .black
        self.layer.cornerRadius = 20
        self.addSubview(characterView)
        self.addSubview(detailView)
        self.characterView.addSubview(wordLabel)
        self.characterView.addSubview(pingYingLabel)
        self.characterView.addSubview(translationLabel)
        self.characterView.addSubview(playButton)
        
        // Constraints
        characterView.widthAnchor.constraint(equalToConstant: self.frame.width-20).isActive=true
        characterView.heightAnchor.constraint(equalToConstant: self.frame.height-30).isActive=true
        characterView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        
        detailView.widthAnchor.constraint(equalToConstant: self.frame.width-20).isActive=true
        detailView.heightAnchor.constraint(equalToConstant: self.frame.height-30).isActive=true
        detailView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        
        wordLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor).isActive=true
        wordLabel.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: -100).isActive=true
        
        pingYingLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor).isActive=true
        pingYingLabel.centerYAnchor.constraint(equalTo: characterView.centerYAnchor).isActive=true
        
        translationLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor).isActive=true
        translationLabel.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: 100).isActive=true
        
        playButton.widthAnchor.constraint(equalTo: characterView.widthAnchor,constant: -100).isActive=true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive=true
        playButton.centerXAnchor.constraint(equalTo: characterView.centerXAnchor).isActive=true
        playButton.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: 170).isActive=true
        
        
        if word.isFlipped == true {
            UIView.transition(from: characterView, to: detailView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews]) { bool in
            }
            
        }
        else {
            UIView.transition(from: detailView, to: characterView, duration: 0, options: [.transitionFlipFromTop,.showHideTransitionViews]) { bool in
            }
        }
        
    }
    
    func flipCard() {
        UIView.transition(from: characterView, to: detailView, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
    }
    func flipBack() {
        UIView.transition(from: detailView, to: characterView, duration: 0.5, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
    }
    
    @objc func playButtonAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            
            self.playButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { bool in
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                
                self.playButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { bool in
                
                UIView.animate(withDuration: 0.2, animations:  {
                    
                }) { bool in
                    
                    UIView.animate(withDuration: 0.2, delay: 2.0) {
                        

                    }
                }
            }
        }
    }
}
