//
//  LoginViewController.swift
//  Donations
//
//  Created by Jessie Tepper on 12/2/18.
//  Copyright © 2018 Jessie Tepper. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let username: String
        username = usernameField.text!
        let password: String
        password = passwordField.text!
        
        let usernameStored = UserDefaults.standard.string(forKey: "email")
        let passwordStored = UserDefaults.standard.string(forKey: "password")
        if (username == usernameStored && password == passwordStored) {
            
        } else if (username.isEmpty && password.isEmpty){
            let alert = UIAlertController(title: "Alert", message: "Please fill out both text fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Username or Password is incorrect", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title:"Try Again", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
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

}
