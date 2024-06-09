//
//  SoundManager.swift
//  ChineseCharacters
//
//  Created by mac on 09.06.2024.
//

import Foundation
import AVFoundation

enum Sounds: String {
    case correct = "correct"
    case flip = "cardFlip"
}

class SoundManager {
    
    static let shared = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(name:String) {
        
     let url = Bundle.main.url(forResource: name, withExtension: "mp3")!
     do {
         player = try AVAudioPlayer(contentsOf: url)
         guard let player = player else { return }
         player.numberOfLoops=0
         player.prepareToPlay()
         player.play()
         
         
     } catch let error as NSError {
         print(error.description)
     }
 }
    
    private init(){}
}
