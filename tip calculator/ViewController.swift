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
    
    var value1 : NSString = "18"
    var value2 : NSString = "20"
    var value3 : NSString = "25"
    //var tipPercentage = [18, 20, 25]
    let defaults = UserDefaults.standard
    @IBOutlet weak var billField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setTitleForSeg() {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                self.setTitleForSeg()
                return;
            }
        }
        NSLog("\(self.value1)")
        self.tipControl.setTitle("\(self.value1)", forSegmentAt: 0)
        self.tipControl.setTitle("\(self.value2)", forSegmentAt: 1)
        self.tipControl.setTitle("\(self.value3)", forSegmentAt: 2)

    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.setTitleForSeg()
        let myarray = defaults.stringArray(forKey: "SavedArray") ?? [String]()
        //value1 = myarray[0] as NSString
        //value2 = myarray[1] as NSString
        //value3 = myarray[2] as NSString
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //let array = ["\(self.value1)", "\(self.value2)", "\(self.value3)"]
        //defaults.set(array, forKey: "SavedArray")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTap(_ sender: Any) {
        view.endEditing(true);
    }

    @IBAction func saveSetting(_ sender: Any) {
        let array = ["\(self.value1)", "\(self.value2)", "\(self.value3)"]
        defaults.set(array, forKey: "SavedArray")
    }
    @IBAction func perentagesChange(_ sender: Any) {
        self.calculateTip(Any)
    }
    @IBAction func calculateTip(_ sender: Any) {
        var tipPercentage = [value1.floatValue*0.01, value2.floatValue*0.01, value3.floatValue*0.01]
        let bill = Float(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        tipTotal.text = String(format: "$%.2f", total)
        
    }
}

