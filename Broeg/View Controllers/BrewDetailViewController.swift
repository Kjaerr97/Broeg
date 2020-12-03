//
//  BrewDetailViewController.swift
//  Broeg
//
//  Created by Anders Brandt on 09/11/2020.
//

import UIKit

class BrewDetailViewController: UIViewController {


    
    
    @IBOutlet weak var coffeeAmount: UITextField!
    
    @IBOutlet weak var waterPerCoffee: UITextField!
    
    @IBOutlet weak var waterDistribution: UITextField!
    
    @IBOutlet weak var waterTemp: UITextField!
    
    @IBOutlet weak var bloomWater: UITextField!
    
    @IBOutlet weak var bloomWaterDistr: UITextField!
    
    var coffee: Coffee? {
        didSet {
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

        // Do any additional setup after loading the view.
    }
    
    
    func configureView() {
        if let coffee = self.coffee {
            if let coffeeAmount = self.coffeeAmount, let waterPerCoffee = waterPerCoffee, let waterDistribution = waterDistribution, let waterTemp = waterTemp, let bloomWater = bloomWater, let bloomWaterDistr = bloomWaterDistr {
                
                title = coffee.name
                coffeeAmount.text = coffee.grams
                waterPerCoffee.text = coffee.waterPerGram
                waterDistribution.text = coffee.waterTime
                waterTemp.text = coffee.waterTemp
                bloomWater.text = coffee.bloomWater
                bloomWaterDistr.text = coffee.bloomTime
                
                
                
                
            }
        }
    
    }
    
    @IBAction func unwindToBrewDetailViewController(segue: UIStoryboardSegue) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
