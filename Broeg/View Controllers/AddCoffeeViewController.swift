//
//  AddCoffeeViewController.swift
//  Broeg
//
//  Created by Anders Brandt on 12/11/2020.
//

import UIKit
import Firebase

class AddCoffeeViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var coffeeNameTF: UITextField!
    
    @IBOutlet weak var gramsCoffeeTF: UITextField!
    
    
    @IBOutlet weak var waterPerGramTF: UITextField!
    
    @IBOutlet weak var waterTimeTF: UITextField!
    
    @IBOutlet weak var waterTempTF: UITextField!
    
    @IBOutlet weak var bloomWaterTF: UITextField!
    
    @IBOutlet weak var bloomTimeTF: UITextField!
    
    var coffee: Coffee?
    
    let dGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let user = Auth.auth().currentUser?.uid
        let db: Firestore = Firestore.firestore()
        let ref = db.collection("users").document(user ?? "").collection("coffeeList")
        if sender as? UIBarButtonItem == doneButton {
            if let name = coffeeNameTF.text, let gramsCoffee = gramsCoffeeTF.text, let waterPerGram = waterPerGramTF.text, let waterTime = waterTimeTF.text, let waterTemp = waterTempTF.text, let bloomWater = bloomWaterTF.text, let bloomTime = bloomTimeTF.text {
                if !name.isEmpty && !gramsCoffee.isEmpty && !waterPerGram.isEmpty && !waterTime.isEmpty && !waterTemp.isEmpty && !bloomWater.isEmpty && !bloomTime.isEmpty {
                    let dict = [
                        "name": name,
                        "grams": gramsCoffee,
                        "waterPerGram": waterPerGram,
                        "waterTime": waterTime,
                        "waterTemp": waterTemp,
                        "bloomWater": bloomWater,
                        "bloomTime": bloomTime,
                        "isFavorite": false
                    ] as [String : Any]
                    
                    
                    ref.addDocument(data: dict)
                    dGroup.wait()
                    
                    coffee = Coffee(dictionary: dict)
                }
            }
        }
    }
}
