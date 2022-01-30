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
        tipAmountLabel.text = String(format: "\(currency)0.00")
        //Update Total Amount
        totalLabel.text = String(format: "\(currency)0.00")
        
        if !defaults.bool(forKey: "customTipType") {
            tipControl.isEnabled = true
            customTip.isEnabled = false
            customTipLabel.isEnabled = false
            customTip.text = ""
        } else {
            tipControl.isEnabled = false
            customTip.isEnabled = true
            customTipLabel.isEnabled = true
        }
        billAmountTextField.text = ""
        customTip.text = ""
    }
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBAction func calculateTip(_ sender: Any) {
        currency = defaults.string(forKey: "currency") ?? "$"
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get Total tip by multiplying tip
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "\(currency)%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "\(currency)%.2f", total)
    }
    
    
    @IBAction func calculateCustomTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = Double(customTip.text!) ?? 0
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "\(currency)%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "\(currency)%.2f", total)

    }
    
    @IBAction func calculateBill(_ sender: Any) {
        if defaults.bool(forKey: "customTipType") {
            calculateCustomTip(sender)
        } else {
            calculateTip(sender)
        }
    }
    
}

