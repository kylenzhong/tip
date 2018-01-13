//
//  ViewController.swift
//  Tip_Calc
//
//  Created by Ruijing Zhong on 12/29/17.
//  Copyright © 2017 KyleZhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentages: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        
        let currentLocale = Locale.current
        let currencySymbol = currentLocale.currencySymbol
        tipLabel.text = currencySymbol! + "00.00"
        totalLabel.text = currencySymbol! + "00.00"
        billField.backgroundColor = UIColor(hue: 0.5306, saturation: 1, brightness: 0.7, alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

/*
    @IBAction func tapScreen(_ sender: Any) {
        view.endEditing(true)
    }
*/
    @IBAction func billChanged(_ sender: Any) {
        let tipPercentages = [15, 18, 20]
        let convert = NumberFormatter()
        convert.numberStyle = .decimal
        let bill = Double(billField.text!) ?? 0
       
        
        let tip = bill * 0.01 * Double(tipPercentages[percentages.selectedSegmentIndex])
        let total = bill + tip
        
        let currentLocale = Locale.current
        let currencySymbol = currentLocale.currencySymbol
        
        tipLabel.text = currencySymbol! + convert.string(for: tip)!
        totalLabel.text = currencySymbol! + convert.string(for: total)!
        
    }
    
 
    
    
}


