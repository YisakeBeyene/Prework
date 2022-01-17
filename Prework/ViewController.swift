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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }


    @IBAction func calculateLiveTip(_ sender: Any) {
        
        
        //Get bill amount from the text field input
        let bill = Double(billAmountTextField.text!) ?? 0

        //Calculate tip amount and total bill
        let tipPercentages = [0.15, 0.18, 0.2]
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
    
    
}

