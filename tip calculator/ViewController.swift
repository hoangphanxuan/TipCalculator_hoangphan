//
//  ViewController.swift
//  tip calculator
//
//  Created by Hoang Phan Xuan on 1/29/17.
//  Copyright © 2017 Phan Xuan Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipTotal: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTap(_ sender: Any) {
        view.endEditing(true);
    }

    @IBAction func perentagesChange(_ sender: Any) {
        calculateTip(Any)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentage = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        tipTotal.text = String(format: "$%.2f", total)
        
    }
}

