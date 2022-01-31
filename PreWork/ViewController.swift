//
//  ViewController.swift
//  PreWork
//
//  Created by Ronte' Parker on 1/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customTip: UITextField!
    @IBOutlet weak var customTipLabel: UILabel!
    
    let defaults = UserDefaults.standard
    var currency: String = "$"
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        currency = defaults.string(forKey: "currency") ?? "$"
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "\(currency)\(tipAmountLabel.text!.dropFirst())")
        //Update Total Amount
        totalLabel.text = String(format: "\(currency)\(totalLabel.text!.dropFirst())")
        
        if !defaults.bool(forKey: "customTipType") {
            tipControl.isEnabled = true
            customTip.isEnabled = false
            customTipLabel.isEnabled = false
            customTip.text = ""
        } else {
            tipControl.isEnabled = false
            customTip.isEnabled = true
            customTipLabel.isEnabled = true
            tipControl.selectedSegmentIndex = 0
        }
    }
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        billAmountTextField.keyboardType = .decimalPad
        customTip.keyboardType = .decimalPad
        
    }
    
    
    
    @IBAction func calculateTip(_ sender: Any) {
        currency = defaults.string(forKey: "currency") ?? "$"
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get Total tip by multiplying tip
        let tipPercentages = [0.15, 0.18, 0.2]
        var tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
//        tip = Double(Int(tip * 100)) / 100.00
        var total = bill + tip
//        total = Double(Int(total * 100)) / 100.00
        
        let tipS: String = thousandsSeperator(tip)
        let totalS: String = thousandsSeperator(total)
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "\(currency)\(tipS)")
        //Update Total Amount
        totalLabel.text = String(format: "\(currency)\(totalS)")
    }
    
    
    @IBAction func calculateCustomTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        var tip = Double(customTip.text!) ?? 0
//        tip = Double(Int(tip * 100)) / 100.00
        var total = bill + tip
//        total = Double(Int(total * 100)) / 100.00
        
        let tipS: String = thousandsSeperator(tip)
        let totalS: String = thousandsSeperator(total)
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "\(currency)\(tipS)")
        //Update Total Amount
        totalLabel.text = String(format: "\(currency)\(totalS)")

    }
    
    @IBAction func calculateBill(_ sender: Any) {
        if defaults.bool(forKey: "customTipType") {
            calculateCustomTip(sender)
        } else {
            calculateTip(sender)
        }
    }
    
    
    func thousandsSeperator(_ num: Double) -> String {
       
        if num > 999 {
            let numString: String = String(Int(num))
            
            let numAfterDecimal = num - Double(Int(num))
            let intAfterDecimal = Int(numAfterDecimal * 100)
            
            let ct = numString.count
            let numOfCommas = ct / 3
            var changedNum: String = String(numString.prefix(ct % 3))
            
            for _ in 1...numOfCommas {
                changedNum.append("," + String(numString.prefix(3)))
            }
            if ct % 3 == 0 {
                changedNum = String(changedNum.dropFirst())
            }
            
            
            changedNum.append(".\(intAfterDecimal)")
            
            return changedNum
            
        } else {
            let numAfterDecimal = (num) - Double(Int(num))
            let intAfterDecimal = Int(numAfterDecimal * 100)
            if intAfterDecimal < 10 {
                if intAfterDecimal == 0 {
                    return String(Int(num)) + ".00"
                }
                return String(Int(num)) + ".0" + String(intAfterDecimal)
            }
            return String(Int(num)) + "." + String(intAfterDecimal)
        }
    }
    
}

