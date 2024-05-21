//
//  WordsCollectionCollectionViewCell.swift
//  ChineseCharacters
//
//  Created by mac on 20.05.2024.
//
import UIKit
import AVFoundation

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var detailTranslationLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
   
    @IBOutlet weak var PingYingLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var player: AVAudioPlayer?
    var character: Character?
    
    func setCharacter(character: Character) {
        
        self.character = character
        self.layer.cornerRadius = 5
        //CharacterViewSettings
        self.characterLabel.text = character.name
        self.characterView.layer.cornerRadius = 5
        self.characterView.layer.shadowOffset = CGSize(width: 0, height: 3 )
        self.characterView.layer.shadowOpacity = 1.0
        self.characterView.layer.shadowRadius = 2
        self.characterView.layer.shadowColor = UIColor.green.cgColor
        
        //DetailViewSettings
       
        self.detailView.layer.cornerRadius = 5
        self.PingYingLabel.text = character.pingYing
        self.PingYingLabel.isHidden = true
        self.detailTranslationLabel.layer.cornerRadius = 0
        self.detailTranslationLabel.text = character.translation
        self.detailTranslationLabel.isHidden = true
     
        self.playButton.layer.borderWidth = 0.5
        self.playButton.layer.borderColor = UIColor.white.cgColor
        self.playButton.layer.cornerRadius = 2
        
        if character.isFlipped == true {
            UIView.transition(from: characterView, to: detailView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
             }
    else {
            UIView.transition(from: detailView, to: characterView, duration: 0, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
        }
    }
    @IBAction func playButtonAction(_ sender: Any) {
    
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
        self.playButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        } completion: { bool in
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                self.playButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { bool in
                UIView.animate(withDuration: 0.2, animations:  {
                    self.PingYingLabel.isHidden = false
                    self.detailTranslationLabel.isHidden = false
                }) { bool in
                    UIView.animate(withDuration: 0.2, delay: 2.0) {
                        self.PingYingLabel.isHidden = true
                        self.detailTranslationLabel.isHidden = true
                    }
                }
            }
        }
        playsound(name: character?.name ?? "")
    }
    
    
    func flipCard() {
        UIView.transition(from: characterView, to: detailView, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
    }
    func flipBack() {
        UIView.transition(from: detailView, to: characterView, duration: 0.5, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
    }
    func playsound(name: String) {
        let urlString = Bundle.main.path(forResource: name, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {return}
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            guard let player = player else {
                return
            }
            player.play()
        } catch {
            print("soundError")
        }
    }
}


