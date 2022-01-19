//
//  SettingsViewController.swift
//  Prework
//
//  Created by Isaac on 1/16/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var darkModeChange: UISwitch!
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
        tipOneTextView.text = String(format:"%.0f%%", defaults.double(forKey: tipOneString)*100)
        tipTwoTextView.text = String(format:"%.0f%%", defaults.double(forKey: tipTwoString)*100)
        tipThreeTextView.text = String(format:"%.0f%%", defaults.double(forKey: tipThreeString)*100)

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
        
        let tipOneValue:Substring = tipOneTextView.text!.dropLast(1)
        defaults.set(Double(tipOneValue)!/100, forKey: tipOneString)
        defaults.synchronize()
        
    }
    
    @IBAction func storeTip2(_ sender: Any) {
        
        let tipTwoValue:Substring = tipTwoTextView.text!.dropLast(1)
        defaults.set(Double(tipTwoValue)!/100, forKey: tipTwoString)
        defaults.synchronize()
        
    }
    
    @IBAction func storeTip3(_ sender: Any) {
        
        let tipThreeValue:Substring = tipThreeTextView.text!.dropLast(1)
        defaults.set(Double(tipThreeValue)!/100, forKey: tipThreeString)
        defaults.synchronize()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        defaults.synchronize()
    }
    
}
