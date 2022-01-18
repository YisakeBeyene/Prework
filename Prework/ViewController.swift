//
//  ViewController.swift
//  Prework
//
//  Created by Isaac on 1/14/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var perPartyTotal: UILabel!
    @IBOutlet weak var partySizeControl: UIStepper!
    let defaults = UserDefaults.standard
    
    let firstLoad = "FirstLoad"
    let tipOneString = "tipOne"
    let tipTwoString = "tipTwo"
    let tipThreeString = "tipThree";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        self.title = "Tip Calculator"
        setDefaults()
        
    }

    func setDefaults(){
        if defaults.bool(forKey: firstLoad) {
            defaults.set(0.15, forKey: tipOneString)
            defaults.set(0.18, forKey: tipTwoString)
            defaults.set(0.20, forKey: tipThreeString)
            defaults.set(false, forKey: firstLoad)        }
    }

    func calculateTipControl() -> Array<Double>{
        return [defaults.double(forKey: tipOneString), defaults.double(forKey: tipTwoString), defaults.double(forKey: tipThreeString)]
    }
    
    
    @IBAction func calculateLiveTip(_ sender: Any) {
        
        //Get bill amount from the text field input
        let bill = Double(billAmountTextField.text!) ?? 0

        //Calculate tip amount and total bill
        let tipPercentages = calculateTipControl()
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        //Update tip amount label
        tipAmountLabel.text = String(format:"$%.2f", tip)
        //Update total amount label
        totalLabel.text = String(format:"$%.2f",total)
        //Update perperson total
        perPartyTotal.text = String(format:"$%.2f", total/partySizeControl.value) + " per person"
        
    }
    
    
    
    @IBAction func changePartySizeStepper(_ sender: UIStepper) {
        
        partySizeLabel.text = String(format: "%.0f", sender.value)
        
        calculateLiveTip(sender)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        defaults.set(true, forKey: firstLoad)
    }
    
}

