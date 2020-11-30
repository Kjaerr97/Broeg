//
//  BrewTableViewController.swift
//  Broeg
//
//  Created by Anders Brandt on 03/11/2020.
//

import UIKit

class BrewTableViewController: UITableViewController {
    
    var coffeeList = [Coffee]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fillCoffeeList()
    }
    
    func fillCoffeeList() {
        // DUMMY DATA
        //TODO: this needs to be dynamic, instead of hardcoded
        let sampleCoffeeList = [Coffee(name: "Cappucino", grams: "30", waterPerGram: "3", waterTime: "20", waterTemp: "80", bloomWater: "7", bloomTime: "10", isFavorite: false), Coffee(name: "Cafe au lait", grams: "30", waterPerGram: "3", waterTime: "20", waterTemp: "80", bloomWater: "7", bloomTime: "10", isFavorite: false), Coffee(name: "Americano", grams: "30", waterPerGram: "3", waterTime: "20", waterTemp: "80", bloomWater: "7", bloomTime: "10", isFavorite: false), Coffee(name: "Latte", grams: "30", waterPerGram: "3", waterTime: "20", waterTemp: "80", bloomWater: "7", bloomTime: "10", isFavorite: false)]

        coffeeList = sampleCoffeeList.compactMap{$0}
        sortCoffeeList()
        //TODO: Implement a method that sorts the favorites
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
