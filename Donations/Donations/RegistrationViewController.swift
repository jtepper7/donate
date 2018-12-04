//
//  RegistrationViewController.swift
//  Donations
//
//  Created by Jessie Tepper on 12/2/18.
//  Copyright © 2018 Jessie Tepper. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var users = [["User", "Location Employee"]]
    var userSelected: String = ""
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return users[0].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return users[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userSelected = users[0][row]
    }

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userPicker: UIPickerView!
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        let name: String
        name = nameField.text!
        let email: String
        email = emailField.text!
        let password: String
        password = passwordField.text!
        
        if (name.isEmpty || email.isEmpty || password.isEmpty) {
            let alert = UIAlertController(title: "Alert", message: "Please fill out all text fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title:"Try Again", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        let alert = UIAlertController(title: "Registration Complete!", message: "Press Cancel button to go back", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPicker.delegate = self
        userPicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
