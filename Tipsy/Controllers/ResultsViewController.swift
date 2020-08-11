//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by ANDY on 12/08/2020.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result = "0.0"
    var tip = 0
    var split = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        settingLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
