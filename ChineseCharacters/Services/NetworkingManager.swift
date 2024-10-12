//
//  NetworkingManager.swift
//  ChineseCharacters
//
//  Created by mac on 21.10.2023.
//

import Foundation
import Alamofire

enum Links: String {
     case charactersLink = "https://api.ctext.org/getcharacter?char="
}
 
class NetworkingManager {
    static let shared = NetworkingManager()
    private init() {}

    
    //Alamofire
    func alamofireGetMethod(character: String, with completion: @escaping(Character) -> Void) {
        let escapedString = character.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        guard let escapedString = escapedString else {return}
        let characterLink = Links.charactersLink.rawValue+escapedString
        
        AF.request(characterLink)
            .validate()
            .responseDecodable(of: Character.self) { response in
                switch response.result{
                case .success(let character):
                    completion(character)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func getFetchAllChracters() {
        let characters = Characters.allCases
        for character in characters {
            let escapedString = character.rawValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            guard let escapedString = escapedString else {return}
            let characterLink = Links.charactersLink.rawValue+escapedString
            
        }
    }
}

