//
//  SettingsViewController.swift
//  PreWork
//
//  Created by Ronte' Parker on 1/27/22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var customTipSwitch: UISwitch!
    @IBOutlet weak var currencyControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func chooseCurrency(_ sender: Any) {
        let currencyList = ["$", "¥", "₱", "€", "£", "₩"]
        let currency = currencyList [currencyControl.selectedSegmentIndex]
        
        defaults.set(currency, forKey: "currency")
        defaults.synchronize()
    }
    
    @IBAction func setTipType(_ sender: Any) {
        let tipType: Bool = customTipSwitch.isOn
        
        defaults.set(tipType, forKey: "tipType")
        defaults.synchronize()
        
    }
    
    
}
