//
//  CharacterView.swift
//  ChineseCharacters
//
//  Created by mac on 01.06.2024.
//

import UIKit
import WebKit
import AVFoundation

class CharacterView: UIView {
    
    var character: String?
    var greenBool: Bool? = false
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        
        label.layer.cornerRadius = 10
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 120.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let readingLabel: UILabel = {
        let label = UILabel()
        
        label.layer.cornerRadius = 5
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36.0)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let characterReadingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
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
    
    private let radicalStrokesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.layer.backgroundColor = UIColor.clear.cgColor
        stackView.spacing = 100
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
        stackView.backgroundColor = .clear
        stackView.spacing = 100
        stackView.distribution = .fillEqually
        stackView.isHidden = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let frontSideView: UIView = {
       let view = UIView()
        view.layer.masksToBounds = true
        view.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 20, alpha: 0.1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 3
        view.layer.borderColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
    
    //MARK: BackSide
    
    private lazy var webView: WKWebView = {
        var webView = WKWebView()
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = WKUserContentController()
        configuration.userContentController.add(self, name: "buttonOne")
        webView = WKWebView(frame: webView.frame, configuration: configuration)
        webView.layer.masksToBounds = true
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.layer.cornerRadius = 10
        webView.layer.borderWidth = 0
        webView.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        return webView
    }()
    
    private let backSideView: UIView = {
       let view = UIView()
        view.layer.masksToBounds = true
        view.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 20, alpha: 0.1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 3
        view.layer.borderColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 0.3)
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUISubViews()
        setGestures()
        setWebView()
        
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
    
    func configure(character: String) {
        
        let colorBool =  UserDefaults.standard.bool(forKey: character)
        self.greenBool = colorBool
        
        if self.greenBool == true {
            layer.shadowColor = UIColor.green.cgColor
        }
        
        self.character=character
        alamofireGetMethod()
    }
    
    
    func setUISubViews() {
        
        backgroundColor = .black
        layer.cornerRadius = 20
        layer.shadowColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 1)
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 25
        layer.masksToBounds = false
        
        characterReadingStackView.addArrangedSubview(characterLabel)
        characterReadingStackView.addArrangedSubview(readingLabel)
        radicalStrokesStackView.addArrangedSubview(radicalLabel)
        radicalStrokesStackView.addArrangedSubview(strokesLabel)
        characterReadingStackView.addArrangedSubview(radicalStrokesStackView)
        stringsStackView.addArrangedSubview(radicalString)
        stringsStackView.addArrangedSubview(strokesString)
        characterReadingStackView.addArrangedSubview(stringsStackView)
        frontSideView.addSubview(characterReadingStackView)
        backSideView.addSubview(webView)
        addSubview(frontSideView)
        addSubview(backSideView)
        
        
        //Constraints
        NSLayoutConstraint.activate([
            
            characterReadingStackView.centerXAnchor.constraint(equalTo: frontSideView.centerXAnchor),
            characterReadingStackView.centerYAnchor.constraint(equalTo: frontSideView.centerYAnchor),
            
            frontSideView.widthAnchor.constraint(equalTo: widthAnchor),
            frontSideView.heightAnchor.constraint(equalTo: heightAnchor),
            frontSideView.centerXAnchor.constraint(equalTo: centerXAnchor),
            frontSideView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            webView.centerXAnchor.constraint(equalTo: backSideView.centerXAnchor),
            webView.topAnchor.constraint(equalTo: backSideView.topAnchor),
            webView.widthAnchor.constraint(equalTo: backSideView.widthAnchor),
            webView.heightAnchor.constraint(equalTo: backSideView.heightAnchor,constant: -100),
            
            backSideView.widthAnchor.constraint(equalTo: widthAnchor),
            backSideView.heightAnchor.constraint(equalTo: heightAnchor),
            backSideView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backSideView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setGestures() {
        let frontSideGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        let backSideGesture = UITapGestureRecognizer(target: self, action: #selector(flipBack))
        frontSideView.addGestureRecognizer(frontSideGesture)
        backSideView.addGestureRecognizer(backSideGesture)
        
    }
    
    //MARK: CardsFunctions
    func setWebView() {
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
    
    @objc func flipCard() {

        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { bool in
            self.newCharacter()
            
            UIView.transition(from: self.frontSideView, to: self.backSideView, duration: 0.5, options: [.transitionFlipFromRight,.showHideTransitionViews]) { bool in
                
                UIView.animate(withDuration: 0.3) {
                    self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    SoundManager.shared.playSound(name: "cardFlip")
                }
                
            }
           
        }
}
    
    @objc func flipBack() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { bool in
            UIView.transition(from: self.backSideView, to: self.frontSideView, duration: 0.3, options: [.transitionFlipFromRight,.showHideTransitionViews]) { bool in
                UIView.animate(withDuration: 0.3) {
                    self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    SoundManager.shared.playSound(name: "cardFlip")
                }
            }
            
        }
}
    
    private func animateLayout() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { bool in
            UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
    
    
    func alamofireGetMethod() {
        
        guard let character=character else {return}
        NetworkingManager.shared.alamofireGetMethod(character: character) { character in
            self.characterLabel.text = character.char
            self.radicalLabel.text = character.radical
            self.strokesLabel.text = character.totalstrokes
            self.readingLabel.text = character.readings?.mandarinpinyin?.first
        }
    }
    
    
    func newCharacter() {
        guard let character=character else {return}
       UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
           
       } completion: { bool in
           self.webView.evaluateJavaScript("newCharacter('\(character)')") { result, error in
               if error == nil {
               }
           }
       }
   }
}

extension CharacterView: WKScriptMessageHandler {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        SoundManager.shared.playSound(name: "correct")
        
        if greenBool == false {
            layer.shadowColor = UIColor.green.cgColor
            greenBool=true
            UserDefaults.standard.set(greenBool, forKey: character ?? "十")
            print(greenBool)
        }

        
    }
}



