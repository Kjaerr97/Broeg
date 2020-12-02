//
//  Coffee.swift
//  Broeg
//
//  Created by Anders Brandt on 08/11/2020.
//

import Foundation

class Coffee {
    let name: String
    let grams: String
    let waterPerGram: String
    let waterTime: String
    let waterTemp: String
    let bloomWater: String
    let bloomTime: String
    var isFavorite: Bool
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "grams": grams,
            "waterPerGram": waterPerGram,
            "waterTime": waterTime,
            "waterTemp": waterTemp,
            "bloomWater": bloomWater,
            "bloomTime": bloomTime,
            "isFavorite": isFavorite
            
        ]
    }
    
    init(name: String, grams: String, waterPerGram: String, waterTime: String, waterTemp: String, bloomWater: String, bloomTime: String, isFavorite: Bool) {
        
        self.name = name
        self.grams = grams
        self.waterPerGram = waterPerGram
        self.waterTime = waterTime
        self.waterTemp = waterTemp
        self.bloomWater = bloomWater
        self.bloomTime = bloomTime
        self.isFavorite = isFavorite
    }
    
    convenience init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
              let grams = dictionary["grams"] as? String,
              let waterPerGram = dictionary["waterPerGram"] as? String,
              let waterTime = dictionary["waterTime"] as? String,
              let waterTemp = dictionary["waterTemp"] as? String,
              let bloomWater = dictionary["bloomWater"] as? String,
              let bloomTime = dictionary["bloomTime"] as? String,
              let isFavorite = dictionary["isFavorite"] as? Bool
              else {return nil}
        
        self.init(name: name, grams: grams, waterPerGram: waterPerGram, waterTime: waterTime, waterTemp: waterTemp, bloomWater: bloomWater, bloomTime: bloomTime, isFavorite: isFavorite)
    }
    
}
