//
//  WordsCollectionCollectionViewCell.swift
//  ChineseCharacters
//
//  Created by mac on 20.05.2024.
//

/*
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
        view.layer.backgroundColor = Colors.background
        view.layer.cornerRadius = 10
        view.layer.borderColor = Colors.border
        view.layer.borderWidth = 2
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = Colors.background
        view.layer.cornerRadius = 10
        view.layer.borderColor = Colors.border
        view.layer.borderWidth = 2
      
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let wordLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 100)
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailWordLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 120)
        let color = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        label.textColor = UIColor(cgColor: color)
        label.textAlignment = .center
        label.layer.cornerRadius = 5
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
        button.layer.backgroundColor = UIColor.clear.cgColor
        button.setTitle("Play", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = Colors.border
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 30
        button.addTarget(nil, action: #selector(playButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
        stackView.layer.backgroundColor = UIColor.clear.cgColor
        stackView.spacing = 30
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let speakButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("SPEAK", for: .normal)
        button.layer.cornerRadius = 5
        
        button.layer.borderColor = Colors.border
        button.layer.borderWidth = 1
        button.addTarget(nil, action: #selector(speakButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    func setWord(word: Word) {
        
        setUISubViews()
        
        self.word = word
        self.wordLabel.text = word.name
        self.detailWordLabel.text = word.name
        self.playButton.setTitle(word.pingYing, for: .normal)
        self.translationLabel.text=word.translation
        
        if word.isFlipped {
            flipCard(duration: 0)
            
        }
        else {
            flipBack(duration: 0)
            
        }
        
    }
    
    func setUISubViews() {
        
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        
        
        vStackView.addArrangedSubview(wordLabel)
        vStackView.addArrangedSubview(playButton)
        vStackView.addArrangedSubview(translationLabel)
        
        characterView.addSubview(vStackView)
        self.addSubview(characterView)
        
        
        self.addSubview(detailView)
        self.detailView.addSubview(speakButton)
        self.detailView.addSubview(detailWordLabel)
        
        let screenWindth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        // Constraints
        NSLayoutConstraint.activate([
            
            characterView.widthAnchor.constraint(equalToConstant: screenWindth-70),
            characterView.heightAnchor.constraint(equalToConstant: screenHeight/1.9),
            characterView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            detailView.widthAnchor.constraint(equalToConstant: screenWindth-70),
            detailView.heightAnchor.constraint(equalToConstant: screenHeight/1.9),
            detailView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            vStackView.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            vStackView.centerYAnchor.constraint(equalTo: characterView.centerYAnchor),
            
            detailWordLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            detailWordLabel.centerYAnchor.constraint(equalTo: detailView.centerYAnchor,constant: -100),
            
            speakButton.widthAnchor.constraint(equalTo: detailView.widthAnchor,constant: -200),
            speakButton.heightAnchor.constraint(equalTo:speakButton.widthAnchor),
            speakButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            speakButton.centerYAnchor.constraint(equalTo: detailView.centerYAnchor,constant: 50)
    
        ])
        
    }
    
    func flipCard(duration: Double) {
        
        UIView.transition(from: characterView, to: detailView, duration: duration, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        self.word?.isFlipped=true
        
    }
    func flipBack(duration: Double) {
        UIView.transition(from: detailView, to: characterView, duration: duration, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        self.word?.isFlipped=false
    }
    
    @objc func playButtonAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState) {
            self.playButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
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
                        
                        
                    }
                }
            }
        }
    }
    
    @objc func speakButtonAction(_ sender: Any) {
        
        if self.speakButton.titleLabel?.text == "Recording" {
            self.speakButton.isEnabled=false
            
        } else if self.speakButton.titleLabel?.text == "SPEAK" {
            
            UIView.animate(withDuration: 4, delay: 0, options: .beginFromCurrentState) {
                self.speakButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                
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
                    self.speakButton.setTitle("SPEAK", for: .normal)
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
            SoundManager.shared.playSound(name: "correct")
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
    

  

}
*/
