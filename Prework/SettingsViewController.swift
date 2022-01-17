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
    
    @IBAction func changeToDarkMode(_ sender: UISwitch) {
        
        if sender.isOn{
            
//            view.backgroundColor = .black
//            label.textColor = [UIColor greenColor];
            
            overrideUserInterfaceStyle = .dark
            
            
        }else{
            
//            view.backgroundColor = .white
            overrideUserInterfaceStyle = .light
        }
        
    }
    
    @IBAction func storeTip1(_ sender: Any) {
        
        let tipOneString:String = tipOne.text!
        defaults.set(Double(tipOneString), forKey: "tipOne")
        defaults.synchronize()
        
    }
    
}
