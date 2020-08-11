//
//  ViewController.swift
//  Tipsy
//
//  Created by ANDY on 12/08/2020.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var sliptNumberLabel: UILabel!
    
    var tipPctValue = 0.1
    var numberOfPeople = 2
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        let buttonText = String(sender.currentTitle!.dropLast())
        let value = Double(buttonText)!
        tipPctValue = value / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sliptNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let textValue = billTextField.text!
        
        if textValue != "" {
            let total = Double(textValue)!
            let value =  total * (1 + tipPctValue) / Double(numberOfPeople)
            
            finalResult = String(format: "%.2f", value)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let vc = segue.destination as! ResultsViewController
            
            vc.result = finalResult
            vc.tip = Int(tipPctValue * 100)
            vc.split = numberOfPeople
            
        }
    }
    
    
}

