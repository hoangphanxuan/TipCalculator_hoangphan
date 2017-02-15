//
//  SetitngViewController.swift
//  tip calculator
//
//  Created by Hoang Phan Xuan on 2/14/17.
//  Copyright © 2017 Phan Xuan Hoang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var txtThirdValue: UITextField!
    @IBOutlet weak var txtSecondValue: UITextField!
    @IBOutlet weak var txtFirstValue: UITextField!
    
    var firstValue : NSString!
    var secondValue : NSString!
    var thirdValue : NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func InputFisrtValue(_ sender: Any) {
        firstValue = txtFirstValue.text! as NSString
        NSLog("\(self.firstValue)")
    }
    
    @IBAction func InputSecondValue(_ sender: Any) {
        secondValue = txtSecondValue.text! as NSString
    }
    
    @IBAction func InputThirdValue(_ sender: Any) {
        thirdValue = txtThirdValue.text! as NSString
    }
    
    
     /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let destinationVC = segue.destination as! ViewController
        destinationVC.value1 = firstValue
        destinationVC.value2 = secondValue
        destinationVC.value3 = thirdValue

    }
}
