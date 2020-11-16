//
//  PasswordReset.swift
//  LoginApp
//
//  Created by 林青筠 on 11/16/20.
//

import UIKit
import Firebase

class PasswordReset: UIViewController {
    

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func confirmAction(_ sender: Any) {
        let email = txtEmail.text
        
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email!) { [weak self] error in
            if error != nil {
                self?.lblStatus.text = "Reset Failed"
            } else {
                self?.lblStatus.text = "Reset Email Sent"
            }
        }
    }
}
