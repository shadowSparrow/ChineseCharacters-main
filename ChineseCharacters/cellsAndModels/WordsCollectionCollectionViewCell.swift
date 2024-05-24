//
//  WordsCollectionCollectionViewCell.swift
//  ChineseCharacters
//
//  Created by mac on 20.05.2024.
//
import UIKit
import AVFoundation
import Speech

class WordsCollectionViewCell: UICollectionViewCell {
    
    var word: Word?
    var synthesizer = AVSpeechSynthesizer()
    
    var audioEngine: AVAudioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer(locale: Locale(identifier: "zh-CN"))
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
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
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
        label.isHidden=true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let translationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        let color = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        label.textColor = UIColor(cgColor: color)
        
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
    
    private let speakButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Speak", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        button.layer.borderWidth = 3
        button.addTarget(self, action: #selector(speakButtonAction), for: .touchUpInside)
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
        self.characterView.addSubview(speakButton)
        
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
        translationLabel.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: 50).isActive=true
        
        playButton.widthAnchor.constraint(equalTo: characterView.widthAnchor,constant: -100).isActive=true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive=true
        playButton.centerXAnchor.constraint(equalTo: characterView.centerXAnchor).isActive=true
        playButton.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: 130).isActive=true
        
        speakButton.widthAnchor.constraint(equalTo: characterView.widthAnchor,constant: -100).isActive=true
        speakButton.heightAnchor.constraint(equalToConstant: 50).isActive=true
        speakButton.centerXAnchor.constraint(equalTo: characterView.centerXAnchor).isActive=true
        speakButton.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: 190).isActive=true
        
        
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
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState) {
            self.playButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.pingYingLabel.isHidden=false
            let utterance = AVSpeechUtterance(string: self.wordLabel.text ?? "风景")
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
            utterance.rate = 0.1
            self.synthesizer.speak(utterance)
            
        } completion: { bool in
            UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
                self.playButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            }) { bool in
                UIView.animate(withDuration: 1,  animations:  {
                    
                }) { bool in
                    UIView.animate(withDuration: 0.2, delay: 2.0) {
                        self.pingYingLabel.isHidden=true
                    }
                }
            }
        }
    }
    
    @objc func speakButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            self.speakButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.pingYingLabel.isHidden = false
            self.pingYingLabel.isHighlighted = true
            
            
            
            let node = self.audioEngine.inputNode
            let recordingFormat = node.outputFormat(forBus: 0)
            
            node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                self.request.append(buffer)
            }
            self.audioEngine.prepare()
                do {
                    try self.audioEngine.start()
                } catch{
                    return print(error)
                }
            
            guard let myReconizer = SFSpeechRecognizer() else {return}
            if !myReconizer.isAvailable {return}
            
            self.recognitionTask = self.speechRecognizer?.recognitionTask(with: self.request, resultHandler: { result, error in
                if let result = result {
                    let bestString = result.bestTranscription.formattedString
                    
                    var lastString: String = ""
                    for segment in result.bestTranscription.segments{
                        let indexTo=bestString.index(bestString.startIndex, offsetBy: segment.substringRange.location)
                        lastString=bestString.substring(from: indexTo)
                        print(lastString)
                    }
                    if lastString == self.wordLabel.text {
                        self.checkTheColorSaid(resultString: "green")
                    } else {
                        self.checkTheColorSaid(resultString: "red")
                    }
                } else if let error = error {
                    print(error)
                }
            })
            
            
        } completion: { bool in
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveEaseInOut, animations: {
                
                self.speakButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.pingYingLabel.isHighlighted = false
                
            }) { bool in
                UIView.animate(withDuration: 0.2, animations:  {
                }) { bool in
                    UIView.animate(withDuration: 0.2, delay: 4.0) {
                        self.pingYingLabel.isHidden=true
                        self.stopRecording()
                    }
                }
            }
        }
    }
    
    func checkTheColorSaid(resultString: String) {
        switch resultString{
        case "red":
            wordLabel.backgroundColor = .red
        case "green":
            wordLabel.backgroundColor = .green
        default: break
        }
    }
    
    
    func stopRecording() {
                self.audioEngine.stop()
                self.request.endAudio()
                self.recognitionTask?.cancel()
                //self.request = nil
                self.recognitionTask = nil
                self.audioEngine.inputNode.removeTap(onBus: 0)
    }
    
}

/*
 
 import Speech

 class ViewController: UIViewController, SFSpeechRecognizerDelegate {
     
     var audioEngine: AVAudioEngine = AVAudioEngine()
     let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer(locale: Locale(identifier: "zh-CN"))
     let request = SFSpeechAudioBufferRecognitionRequest()
     var recognitionTask: SFSpeechRecognitionTask?
     
     private lazy var speakButton: UIButton = {
         let button = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 150, height: 150)))
         button.center.x = self.view.center.x
         button.center.y = self.view.center.y+100
         button.backgroundColor = .black
         button.layer.cornerRadius = 75
         button.layer.borderWidth = 4
         
         button.layer.borderColor = UIColor.yellow.cgColor
         button.titleLabel?.textColor = .white
         button.setTitle("Voice", for: .normal)
         button.addTarget(self, action: #selector(recordAndRecognizeSpeech), for: .touchUpInside)
         return button
     }()
     private lazy var label: UILabel = {
         let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 100)))
         label.backgroundColor = .black
         label.center.x = self.view.center.x
         label.center.y = self.view.center.y-300
         label.layer.cornerRadius=30
         label.clipsToBounds = true
         label.backgroundColor = .black
         label.layer.borderWidth = 4
         label.layer.borderColor = UIColor.yellow.cgColor
         label.textAlignment = .center
         label.font.withSize(10)
         label.text = "你好"
         label.textColor = .white
         label.numberOfLines = 0
         return label
     }()
     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.backgroundColor = .black
         setUIElements()
         print(SFSpeechRecognizer.supportedLocales())
     }
     func setUIElements() {
         self.view.addSubview(speakButton)
         self.view.addSubview(label)
     }
     
     @objc func recordAndRecognizeSpeech() {
         let node = audioEngine.inputNode
         let recordingFormat = node.outputFormat(forBus: 0)
         
         node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
             self.request.append(buffer)
         }
         audioEngine.prepare()
             do {
                 try audioEngine.start()
             } catch{
                 return print(error)
             }
         
         guard let myReconizer = SFSpeechRecognizer() else {return}
         if !myReconizer.isAvailable {return}
         
         recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { result, error in
             if let result = result {
                 let bestString = result.bestTranscription.formattedString
                 
                 var lastString: String = ""
                 for segment in result.bestTranscription.segments{
                     let indexTo=bestString.index(bestString.startIndex, offsetBy: segment.substringRange.location)
                     lastString=bestString.substring(from: indexTo)
                 }
                 if lastString == self.label.text {
                     self.checkTheColorSaid(resultString: "green")
                 } else {
                     self.checkTheColorSaid(resultString: "red")
                 }
             } else if let error = error {
                 print(error)
             }
         })
     }
     func checkTheColorSaid(resultString: String) {
         switch resultString{
         case "red":
             label.backgroundColor = .red
         case "green":
             label.backgroundColor = .green
         default: break
         }
     }
 }


 */
