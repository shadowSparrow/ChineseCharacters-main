//
//  WordView.swift
//  ChineseCharacters
//
//  Created by mac on 22.06.2024.
//

import UIKit


class WordView: UIView {
    
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
        layer.cornerRadius = 20
        layer.shadowColor = CGColor(srgbRed: 0.5, green: 0.1, blue: 0.5, alpha: 1)
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 25
        layer.masksToBounds = false
        
        addSubview(frontSideView)
        addSubview(backSideView)
        
        
        //Constraints
        NSLayoutConstraint.activate([
            
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
    
    
    @objc func flipCard() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { bool in
            
            
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

    
}
