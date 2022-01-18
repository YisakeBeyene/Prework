//
//  SettingsViewController.swift
//  Prework
//
//  Created by Isaac on 1/16/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var darkModeChange: UISwitch!
    @IBOutlet weak var tipOne: UITextField!
    @IBOutlet weak var tipOneTextView: UITextField!
    @IBOutlet weak var tipTwoTextView: UITextField!
    @IBOutlet weak var tipThreeTextView: UITextField!
    
    let defaults = UserDefaults.standard
    
    let darkOnOff = "darkOnOff"
    let tipOneString = "tipOne"
    let tipTwoString = "tipTwo"
    let tipThreeString = "tipThree"

    override func viewDidLoad() {
        super.viewDidLoad()
        checkSwitchState()
        changeToDarkMode(darkModeChange)
        // Do any additional setup after loading the view.
        setTipValues()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setTipValues(){
        tipOneTextView.text = String(defaults.double(forKey: tipOneString))
        tipTwoTextView.text = String(defaults.double(forKey: tipTwoString))
        tipThreeTextView.text = String(defaults.double(forKey: tipThreeString))

    }
    
    func checkSwitchState(){
        if defaults.bool(forKey: darkOnOff) {
            darkModeChange.setOn(true, animated: false)
        }else{
            darkModeChange.setOn(false, animated: false)
        }
    }
    
    @IBAction func changeToDarkMode(_ sender: UISwitch) {
        
        if sender.isOn{
            
            defaults.set(true, forKey: darkOnOff)
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
            
            
        }else{
            
            defaults.set(false, forKey: darkOnOff)
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
        }
        
    }
    
    @IBAction func storeTip1(_ sender: Any) {
        
        let tipOneValue:String = tipOne.text!
        defaults.set(Double(tipOneValue)!/100, forKey: tipOneString)
        defaults.synchronize()
        
    }
    
}
