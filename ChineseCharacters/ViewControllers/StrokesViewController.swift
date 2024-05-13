//
//  StrokesViewController.swift
//  ChineseCharacters
//
//  Created by mac on 10.05.2024.
//

import UIKit
import WebKit

class StrokesViewController: UIViewController {
    
    var character: String?
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.layer.masksToBounds = true
        webView.isOpaque = false
        webView.layer.backgroundColor = UIColor.black.cgColor
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.layer.cornerRadius = 20
        webView.layer.borderWidth = 3
        webView.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        return webView
    }()
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = CGColor(red: 171, green: 139, blue: 0, alpha: 0.6)
        button.setTitle("Start", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(newCharacter), for: .touchUpInside)
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Cancel", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(newCharacter), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setUIElements()
    }
    
    func setUIElements() {
        
        self.view.addSubview(webView)
        self.view.addSubview(button)
        
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        
        
        let screenWindth = UIScreen.main.bounds.width-70
        let screenHeight = UIScreen.main.bounds.height-500
        
        webView.widthAnchor.constraint(equalToConstant: screenWindth).isActive = true
        webView.heightAnchor.constraint(equalToConstant: screenHeight).isActive = true
        webView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        webView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        button.widthAnchor.constraint(equalToConstant: screenWindth).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 30).isActive = true
    }
    
    @objc func newCharacter() {
        webView.evaluateJavaScript("newCharacter('\(self.character ?? "水")')") { result, error in
            if error == nil {
            }
            self.button.backgroundColor = .darkGray
            self.button.isEnabled = false
        }

    }
    
    func newQuizz() {
        webView.evaluateJavaScript("newCharacter('\(self.character ?? "水")')") { result, error in
            if error == nil {
            }
            self.button.isHidden = true
        }
    }
}
