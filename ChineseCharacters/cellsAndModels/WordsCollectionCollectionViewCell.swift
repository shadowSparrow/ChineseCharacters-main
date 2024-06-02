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
    let volume: Float = 1.0
    var audioEngine: AVAudioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer(locale: Locale(identifier: "zh-CN"))
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var player: AVAudioPlayer?
    
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
        label.layer.cornerRadius = 5
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
        button.addTarget(nil, action: #selector(playButtonAction), for: .touchUpInside)
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
        button.addTarget(nil, action: #selector(speakButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    func setWord(word: Word) {
        
        setUISubViews()
        
        self.word = word
        self.wordLabel.text = word.name
        self.pingYingLabel.text=word.pingYing
        self.translationLabel.text=word.translation
        
        if word.isFlipped {
            flipCard(duration: 0)
        }
        else {
            flipBack(duration: 0)
            
            
        }
        
    }
    
    func setUISubViews() {
        
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
        NSLayoutConstraint.activate([
            
            characterView.widthAnchor.constraint(equalToConstant: self.frame.width-20),
            characterView.heightAnchor.constraint(equalToConstant: self.frame.height-30),
            characterView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            detailView.widthAnchor.constraint(equalToConstant: self.frame.width-20),
            detailView.heightAnchor.constraint(equalToConstant: self.frame.height-30),
            detailView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            wordLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            wordLabel.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: -100),
            
            pingYingLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            pingYingLabel.centerYAnchor.constraint(equalTo: characterView.centerYAnchor),
            
            translationLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            translationLabel.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: 50),
            
            playButton.widthAnchor.constraint(equalTo: characterView.widthAnchor,constant: -100),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            playButton.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: 130),
            
            speakButton.widthAnchor.constraint(equalTo: characterView.widthAnchor,constant: -100),
            speakButton.heightAnchor.constraint(equalToConstant: 50),
            speakButton.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            speakButton.centerYAnchor.constraint(equalTo: characterView.centerYAnchor,constant: 190)
    
        ])
        
    }
    
    func flipCard(duration: Double) {
        
        UIView.transition(from: characterView, to: detailView, duration: duration, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        self.word?.isFlipped=true
    }
    func flipBack(duration: Double) {
        UIView.transition(from: detailView, to: characterView, duration: duration, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        self.word?.isFlipped=false
    }
    
    @objc func playButtonAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState) {
            self.playButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.pingYingLabel.isHidden=false
            let utterance = AVSpeechUtterance(string: self.wordLabel.text ?? "风景")
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
            utterance.rate = 0.1
            utterance.volume = self.volume
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
        
        if self.speakButton.titleLabel?.text == "Recording" {
            self.speakButton.isEnabled=false
            
        } else if self.speakButton.titleLabel?.text == "Speak" {
            
            UIView.animate(withDuration: 4, delay: 0, options: .beginFromCurrentState) {
                self.speakButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                self.pingYingLabel.isHidden = false
                self.speakButton.setTitle("Recording", for: .normal)
                
                self.createAudioSession()
                self.startRecording()
                self.createRecognitionTask()
                
            } completion: { bool in
                
                UIView.animate(withDuration: 0.5, delay: 0) {
                    self.speakButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.stopRecording()
                    self.checkTheColorSaid(resultString: "gold")
                } completion: { bool in
                    self.speakButton.setTitle("Speak", for: .normal)
                }
            }
        }
    }
    
    func startRecording() {
     createAudioSession()
        startAudioEngine()
    }
    
    func createAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
            do
            {
                try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
                try audioSession.setMode(AVAudioSession.Mode.default)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
                try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            }
            catch
            {
                print("audioSession properties weren't set because of an error.")
            }
    }
    
    func createRecognitionTask() {
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
                    self.pingYingLabel.isHidden=true
                    //self.stopRecording()
                } else {
                    self.speakButton.titleLabel?.text = "Recording"
                    self.checkTheColorSaid(resultString: "gold")
                }
            } else if let error = error {
                print(error)
            }
        })
    }
    
    func checkTheColorSaid(resultString: String) {
        switch resultString{
        case "red":
            characterView.layer.borderColor = UIColor.red.cgColor
        case "green":
            characterView.layer.borderColor = UIColor.green.cgColor
            playSound()
            break
        case "gold":
            characterView.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        default: break
        }
    }
    
    func startAudioEngine() {
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
    }
    
    func stopRecording() {
                self.audioEngine.stop()
                self.request.endAudio()
                self.recognitionTask?.cancel()
                self.recognitionTask = nil
                self.audioEngine.inputNode.removeTap(onBus: 1)
    }
    

  func playSound() {
     let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")!
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

}
