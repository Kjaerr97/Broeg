//
//  BrewTimerViewController.swift
//  Broeg
//
//  Created by Anders Brandt on 03/12/2020.
//

import UIKit

class BrewTimerViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var doneButon: UIBarButtonItem!
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    var coffeeTimer = 10
    var progressCounter = 0.0
    let progress = Progress(totalUnitCount: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        progress.completedUnitCount = 0
        self.timeLeftLabel.text = "Time left: \(self.coffeeTimer) seconds."
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.coffeeTimer > 0 {
                    print ("\(self.coffeeTimer) seconds")
                    self.coffeeTimer -= 1
                    self.progress.completedUnitCount += 1
                    self.progressBar.setProgress(Float(self.progress.fractionCompleted), animated: true)
                    self.timeLeftLabel.text = "Time left: \(self.coffeeTimer) seconds."
                } else {
                    Timer.invalidate()
                    self.progressBar.progressTintColor = .green
                    self.doneButon.isEnabled = true
                    self.timeLeftLabel.text = "Your coffee is done."
                }
            }
    }
}
