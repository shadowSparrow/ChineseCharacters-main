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
/*
    func fetchData(of character: String, with completion: @escaping(Character) -> Void) {
        let originalString = character
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        guard let escapedString = escapedString else { return }
        let characterLink = Links.charactersLink.rawValue + escapedString
        guard let url = URL(string: characterLink ) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "NoError description")
                return
            }
            do {
                let json = try JSONDecoder().decode(Character.self, from: data)
                print(json)
                    DispatchQueue.main.async {
                        completion(json)
                    }
            }
            catch {
                print(error)
            }
        }.resume()
    }
   */
    
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
}

