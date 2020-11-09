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
        //TODO: this needs to be dynamic, instead of hardcoded
        let sampleCoffeeList = [Coffee(name: "Cappucino", grams: 30, gramsPerCoffee: 3, waterTime: 20, waterTemp: 80, bloomWater: 7, bloomTime: 10), Coffee(name: "Cafe au lait", grams: 30, gramsPerCoffee: 3, waterTime: 20, waterTemp: 80, bloomWater: 7, bloomTime: 10), Coffee(name: "Americano", grams: 30, gramsPerCoffee: 3, waterTime: 20, waterTemp: 80, bloomWater: 7, bloomTime: 10), Coffee(name: "Latte", grams: 30, gramsPerCoffee: 3, waterTime: 20, waterTemp: 80, bloomWater: 7, bloomTime: 10)]
        
        coffeeList = sampleCoffeeList.compactMap{$0}
        sortCoffeeList()
        //TODO: Implement a method that sorts the favorites
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
        
        let coffee = coffeeList[indexPath.row]
        cell.textLabel?.text = coffee.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
