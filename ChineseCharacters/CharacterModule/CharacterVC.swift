//
//  ViewController.swift
//  ChineseCharacters
//
//  Created by mac on 13.10.2023.
//

import UIKit

class CharacterVC: UIViewController {
    
    var character: String?
    
    private let characterClassView: CharacterView = CharacterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        characterClassView.configure(character: character ?? "你")
        characterClassView.setUI(view: self.view)
    }
}







