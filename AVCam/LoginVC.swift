//
//  LoginVC.swift
//  AVCam Swift
//
//  Created by 小林 泰 on 2017/03/16.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit
//import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailField.text, let pass = passwordField.text , (email.characters.count > 0 && pass.characters.count > 0) {
            
            // call teh login service
            AuthService.instance.login(email:email,password:pass)
            
            
        } else {
            let alert = UIAlertController(title: "Username and Password required", message: "You must enter both a username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }


}
