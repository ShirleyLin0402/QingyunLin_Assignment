//
//  registerviewcontroller.swift
//  LoginApp
//
//  Created by 林青筠 on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class RegisterViewController: UIViewController{
    

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func registerAction(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter valid email and password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        SwiftSpinner.show("Signing up......")
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            SwiftSpinner.hide()
            
            if(error != nil) {
                self.lblStatus.text = "Error"
                print("error")
                return
            }
            self.lblStatus.text = "User created!"
        }
    }
}
