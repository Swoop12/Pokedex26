//
//  Pokemon.swift
//  Pokedex26
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

class Pokemon {
    let name: String
    let id: Int
    let weight: Int
    let imageUrl: String
    
    init(name: String, id: Int, weight: Int, imageUrl: String){
        self.name = name
        self.id = id
        self.weight = weight
        self.imageUrl = imageUrl
    }
    
    convenience init?(dictionary: [String : Any]) {
        //1) Pull the necessary values out of the dictionary (json)
        guard let nameFromJson = dictionary["name"] as? String,
            let idFromJson = dictionary["id"] as? Int,
            let weightFromJson = dictionary["weight"] as? Int,
            let spritesDictionary = dictionary["sprites"] as? [String : String?],
            let imageUrlFromJson = spritesDictionary["front_default"] as? String
            else { return nil }
        
        //2) Call the memberwise init with those values
        self.init(name: nameFromJson, id: idFromJson, weight: weightFromJson, imageUrl: imageUrlFromJson)
    }
}
