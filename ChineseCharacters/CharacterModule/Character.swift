//
//  Character.swift
//  ChineseCharacters
//
//  Created by mac on 15.10.2023.
//

import Foundation
import Alamofire

struct Character: Codable {
    let char: String?
    let radical: String?
    let readings: Reading?
    let totalstrokes: String?
}
struct Reading: Codable {
    let mandarinpinyin: [String]?
}

