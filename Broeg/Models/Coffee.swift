//
//  Coffee.swift
//  Broeg
//
//  Created by Anders Brandt on 08/11/2020.
//

import Foundation

class Coffee {
    var name: String
    var grams: String
    var waterPerGram: String
    var waterTime: String
    var waterTemp: String
    var bloomWater: String
    var bloomTime: String
    var isFavorite: Bool
    
    init?(name: String, grams: String, waterPerGram: String, waterTime: String, waterTemp: String, bloomWater: String, bloomTime: String, isFavorite: Bool) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.grams = grams
        self.waterPerGram = waterPerGram
        self.waterTime = waterTime
        self.waterTemp = waterTemp
        self.bloomWater = bloomWater
        self.bloomTime = bloomTime
        self.isFavorite = isFavorite
    }
    
}
