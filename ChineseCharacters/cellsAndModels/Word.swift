//
//  Character.swift
//  ChineseCharacters
//
//  Created by mac on 20.05.2024.
//

import Foundation

class Word {
    let name: String
    let imageName: String
    let pingYing: String
    let translation: String
    var isFlipped: Bool = false
    init(name: String, imageName: String, pingYing: String, translation: String) {
        self.name = name
        self.imageName = imageName
        self.pingYing = pingYing
        self.translation = translation
    }
}

/*
extension Character {
    static func getCharacters(charactersData:[CharacterData]) -> [Character] {
        var characters:[Character] = []
        for character in charactersData {
        let currentCharacter = Character(name: character.character, imageName: character.imageName, pingYing: character.pingYing, translation: character.translation)
            characters.append(currentCharacter)
        }
        return characters
             }
}
*/
