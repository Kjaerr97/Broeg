//
//  BrewTableViewController.swift
//  Broeg
//
//  Created by Anders Brandt on 03/11/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class BrewTableViewController: UITableViewController {
    
    
    var coffeeList: [Coffee] = []
    
    let db: Firestore = Firestore.firestore()
    
    let dGroup = DispatchGroup()
    
    
    override func viewDidLoad() {
        fetchCoffeeData()
        super.viewDidLoad()
        self.tableView.reloadData()

    }
    
    func fetchCoffeeData() {
        let user = Auth.auth().currentUser?.uid
        let ref = db.collection("users").document(user ?? "").collection("coffeeList")
        ref.getDocuments { (querySnapshot,err ) in
            if let err = err {
                print("Error getting documents: \(err)" )
            } else {
                for document in querySnapshot!.documents {
                    self.dGroup.enter()
                    let data = document.data()
                    let dict = [
                        "name": data["name"],
                        "grams": data["grams"],
                        "waterPerGram": data["waterPerGram"],
                        "waterTime": data["waterTime"],
                        "waterTemp": data["waterTemp"],
                        "bloomWater": data["bloomWater"],
                        "bloomTime": data["bloomTime"],
                        "isFavorite": data["isFavorite"]
                    ]
                    let coffee = Coffee(dictionary: dict as [String : Any])
                    self.coffeeList.append(coffee!)
                    self.sortCoffeeList()
                    self.dGroup.leave()
                    
                    
                    for element in self.coffeeList {
                        print(element.name)
                    }
            }
        }
            self.dGroup.notify(queue: .main) {
                self.tableView.reloadData()
            }
    }
        
        
}
    
    
    func CoffeeTappedOn(cell: UITableViewCell) {
        let indexPathTapped = tableView.indexPath(for: cell)
        
        let coffee = coffeeList[indexPathTapped!.row]
        
        let isFavorited = coffee.isFavorite
        
        coffeeList[indexPathTapped!.row].isFavorite = !isFavorited
        
        tableView.reloadRows(at: [indexPathTapped!], with: .fade)
    }
    
    func sortCoffeeList() {
        coffeeList.sort { (coffee1, coffee2) -> Bool in
            if coffee1.name != coffee2.name {
                return coffee1.name < coffee2.name
            }
            else {
                return coffee1.grams < coffee2.grams
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath)
        
        // Configure the cell...
        let starButton = UIButton(type: .system)
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        starButton.tintColor = .red
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        
        cell.accessoryView = starButton
        
        let coffee = coffeeList[indexPath.row]
        cell.textLabel?.text = coffee.name
        
        cell.accessoryView?.tintColor = coffee.isFavorite ? UIColor.red : .lightGray
        
        return cell
    }
    
    @objc func handleMarkAsFavorite() {
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCoffeeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let coffee = coffeeList[indexPath.row]
                let brewDetailViewController = segue.destination as! BrewDetailViewController
                brewDetailViewController.coffee = coffee
            }
        }
    }
    
    @IBAction func unwindToTableViewController(segue: UIStoryboardSegue) {
        let addCoffeeViewController = segue.source as! AddCoffeeViewController
        
        if let cofee = addCoffeeViewController.coffee {
            coffeeList.append(cofee)
            sortCoffeeList()
            self.tableView.reloadData()
        }
    }

}
