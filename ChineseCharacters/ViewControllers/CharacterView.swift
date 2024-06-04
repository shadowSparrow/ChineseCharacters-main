//
//  CharacterView.swift
//  ChineseCharacters
//
//  Created by mac on 01.06.2024.
//

import UIKit
import WebKit

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
    
    private let frontSideView: UIView = {
       let view = UIView()
        view.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 20, alpha: 0.1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 3
        view.layer.borderColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 0.3)
        view.layer.shadowColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 1)
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
    
    //MARK: BackSide
    /*
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
    */
    
    private let backSideView: UIView = {
       let view = UIView()
        
        view.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 20, alpha: 0.1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 3
        view.layer.borderColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 0.3)
        view.layer.shadowColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 1)
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 30
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUISubViews()
        setGestures()
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
        
        backgroundColor = .black
        
        characterReadingStackView.addArrangedSubview(characterLabel)
        characterReadingStackView.addArrangedSubview(readingLabel)
        radicalStrokesStackView.addArrangedSubview(radicalLabel)
        radicalStrokesStackView.addArrangedSubview(strokesLabel)
        characterReadingStackView.addArrangedSubview(radicalStrokesStackView)
        stringsStackView.addArrangedSubview(radicalString)
        stringsStackView.addArrangedSubview(strokesString)
        characterReadingStackView.addArrangedSubview(stringsStackView)
        frontSideView.addSubview(characterReadingStackView)
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
    
    @objc func flipCard() {
        UIView.transition(from: frontSideView, to: backSideView, duration: 0.5, options: [.transitionFlipFromRight,.showHideTransitionViews]) { bool in
        }
    }
    
    @objc func flipBack() {
        UIView.transition(from: backSideView, to: frontSideView, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews]) { bool in

            }
        }
}
