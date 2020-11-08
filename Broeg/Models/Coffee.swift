//
//  Coffee.swift
//  Broeg
//
//  Created by Anders Brandt on 08/11/2020.
//

import Foundation

class Coffee {
    var name: String
    var grams: Int
    var gramsPerCoffee: Int
    var waterTime: Int
    var waterTemp: Double
    var bloomWater: Int
    var bloomTime: Int
    
    init?(name: String, grams: Int, gramsPerCoffee: Int, waterTime: Int, waterTemp: Double, bloomWater: Int, bloomTime: Int) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.grams = grams
        self.gramsPerCoffee = gramsPerCoffee
        self.waterTime = waterTime
        self.waterTemp = waterTemp
        self.bloomWater = bloomWater
        self.bloomTime = bloomTime
    }
    
}
