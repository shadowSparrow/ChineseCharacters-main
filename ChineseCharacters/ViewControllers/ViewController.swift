//
//  ViewController.swift
//  ChineseCharacters
//
//  Created by mac on 13.10.2023.
//

import UIKit
import Alamofire
import WebKit
import AVFoundation

class ViewController: UIViewController {
    
    var character: String?
    var player: AVAudioPlayer?
    
    private let characterClassView: CharacterView = CharacterView()
    
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
  
    
    private let webViewBackground: UIView = {
       
         let view = UIView()
         view.backgroundColor = .clear
         view.layer.cornerRadius = 20
         view.layer.borderWidth = 3
         view.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
         view.translatesAutoresizingMaskIntoConstraints = false
         view.isHidden=true
        
        return view
        
    }()
    
    private lazy var webView: WKWebView = {
        var webView = WKWebView()
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = WKUserContentController()
        configuration.userContentController.add(self, name: "buttonOne")
        webView = WKWebView(frame: webView.frame, configuration: configuration)
        webView.layer.masksToBounds = true
        webView.isOpaque = false
        webView.layer.backgroundColor = UIColor.black.cgColor
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.layer.cornerRadius = 20
        webView.layer.borderWidth = 3
        webView.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        return webView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        characterClassView.setWebView()
        //setUIElements()
        //alamofireGetMethod()
    }
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        
        characterClassView.setUI(view: self.view)
        
        //animateLayout()
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
        webViewBackground.addSubview(webView)
        
        
        self.view.addSubview(characterView)
        self.view.addSubview(webViewBackground)
        
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        
        
        //setConstraints
        let screenWindth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let viewWindth = screenWindth-70
        let viewHeight = screenHeight-400
        
        NSLayoutConstraint.activate([
            
            characterView.widthAnchor.constraint(equalToConstant: viewWindth),
            characterView.heightAnchor.constraint(equalToConstant: viewHeight-50),
            characterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -70),
            
            webViewBackground.widthAnchor.constraint(equalToConstant: viewWindth),
            webViewBackground.heightAnchor.constraint(equalToConstant: viewHeight-50),
            webViewBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            webViewBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -70),
            
            webView.widthAnchor.constraint(equalTo: webViewBackground.widthAnchor),
            webView.heightAnchor.constraint(equalTo: webViewBackground.widthAnchor,constant: -40),
            
            webView.centerXAnchor.constraint(equalTo: webViewBackground.centerXAnchor),
            webView.topAnchor.constraint(equalTo: webViewBackground.topAnchor),
            
            characterLabel.widthAnchor.constraint(equalToConstant: 200),
            characterLabel.heightAnchor.constraint(equalToConstant: 150),
            characterLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            characterLabel.topAnchor.constraint(equalTo: characterView.topAnchor, constant: 10),
            
            readingLabel.widthAnchor.constraint(equalToConstant: 200),
            readingLabel.heightAnchor.constraint(equalToConstant: 38),
            readingLabel.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            readingLabel.topAnchor.constraint(equalTo: characterLabel.bottomAnchor),
            
            characterDataStackView.widthAnchor.constraint(equalToConstant: viewWindth),
            characterDataStackView.heightAnchor.constraint(equalToConstant: 80),
            characterDataStackView.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            characterDataStackView.topAnchor.constraint(equalTo: readingLabel.bottomAnchor,constant: 25),
            
            stringsStackView.widthAnchor.constraint(equalToConstant: viewWindth),
            stringsStackView.heightAnchor.constraint(equalToConstant: 40),
            stringsStackView.centerXAnchor.constraint(equalTo: characterView.centerXAnchor),
            stringsStackView.topAnchor.constraint(equalTo: characterDataStackView.bottomAnchor,constant: 20),
            
             ])

        let viewGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        characterView.addGestureRecognizer(viewGesture)
        
        let webViewBackgroundGesture = UITapGestureRecognizer(target: self, action: #selector(flipBack))
        webViewBackground.addGestureRecognizer(webViewBackgroundGesture)
        
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
   
    private func animateLayout() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            
        } completion: { bool in
            UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
                
            }
        }
    }
    
    @objc func flipCard() {
        UIView.transition(from: characterView, to: webViewBackground, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews]) { bool in
            self.newCharacter()
        }
    }
    
    @objc func flipBack() {
        UIView.transition(from: webViewBackground, to: characterView, duration: 0.5, options: [.transitionFlipFromRight,.showHideTransitionViews]) { bool in
            if self.webViewBackground.layer.borderColor == UIColor.green.cgColor {
                self.characterView.layer.borderColor = UIColor.green.cgColor
            }
            
            
        }
    }
    
     func newCharacter() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            
        } completion: { bool in
            self.webView.evaluateJavaScript("newCharacter('\(self.characterLabel.text ?? "水")')") { result, error in
                if error == nil {
                }
            }
        }
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

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        playSound()
        webViewBackground.layer.borderColor = UIColor.green.cgColor
    }
    
    
}





