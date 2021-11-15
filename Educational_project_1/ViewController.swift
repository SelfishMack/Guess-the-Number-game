//
//  ViewController.swift
//  Educational_project_1
//
//  Created by Владимир Макаров on 15.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textLabel: UILabel!
    
    
    
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkNumber() {
        if self.round == 0 {
            self.number = Int.random(in: 1...50)
            textLabel.text = String(self.number)
            self.round = 1
        } else {
            let numSlider = Int(self.slider.value.rounded())
            if numSlider > self.number {
                self.points += 50 + numSlider - self.number
            } else if numSlider < self.number {
                self.points += 50 + self.number - numSlider
            } else {
                self.points += 50
            }
        }
        if self.round == 5 {
            let alert = UIAlertController(title: "Игра окончена", message: "Набранные очки: \(self.points)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать сначала", style: .default))
            self.present(alert, animated: true)
            self.slider.value = 25
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
        textLabel.text = String(self.number)
    }
}

