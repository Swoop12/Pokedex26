//
//  PokemonController.swift
//  Pokedex26
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseUrlString = "https://pokeapi.co/api/v2"
    
    static func fetchPokemonWith(name: String, completion: @escaping (Pokemon?) -> Void){
        //1) Constructing the Url/url Request
        guard let baseUrl = URL(string: PokemonController.baseUrlString) else { completion(nil) ; return }
        let fullUrl = baseUrl.appendingPathComponent("pokemon").appendingPathComponent(name)
        print(fullUrl.absoluteString)
        
        //2) Datatask Completion
        URLSession.shared.dataTask(with: fullUrl) { (data, _, error) in
            if let error = error{
                print("\(error.localizedDescription) \(error) in function: \(#function)")
                completion(nil)
                return
            }
            guard let data = data else { completion(nil) ; return }
            do {
                guard let pokeDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] else { completion(nil) ; return }
                let pokemon = Pokemon(dictionary: pokeDictionary)
                completion(pokemon)
            }catch {
                print("There was as error in \(#function) :  \(error) \(error.localizedDescription)")
                completion(nil)
                return
            }
        }.resume()
    }
    
}
