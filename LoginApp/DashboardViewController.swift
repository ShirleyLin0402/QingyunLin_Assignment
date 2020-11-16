//
//  DashboardViewController.swift
//  LoginApp
//
//  Created by Ashisish on 11/6/20.
//

import UIKit
import Firebase

class DashboardViewController: UIViewController {

    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popViewController(animated: true)
        }
        catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
            lblStatus.text = signOutError.localizedDescription
        }

        
    }
    

}
