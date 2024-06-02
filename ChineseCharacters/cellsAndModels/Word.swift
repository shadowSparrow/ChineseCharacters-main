//
//  Character.swift
//  ChineseCharacters
//
//  Created by mac on 20.05.2024.
//

import Foundation

struct Word {
    let name: String
    let pingYing: String
    let translation: String
    var isFlipped: Bool = false
}

extension Word {
    static func getWords() -> [Word] {
        var words: [Word] = DataManager.shared.familyCharacters
        for word in words {
            let currentWord = Word(name: word.name, pingYing: word.pingYing, translation: word.translation)
        }
        return words
             }
}
