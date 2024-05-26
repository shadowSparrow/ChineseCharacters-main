//
//  Character.swift
//  ChineseCharacters
//
//  Created by mac on 15.10.2023.
//

import Foundation
import Alamofire

//  Alamofire gitCheck
struct Character: Decodable {
    let char: String?
    let radical: String?
    let readings: Reading?
    let totalstrokes: String?
}
struct Reading: Decodable {
    let mandarinpinyin: [String]?
}

