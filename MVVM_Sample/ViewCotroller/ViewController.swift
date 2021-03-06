//
//  ViewController.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 08/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let server_url = Environment().configuration(PlistKey.ServerURL)
        print(server_url)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DidTapLoginButton(_ sender: Any) {
        
        
        AuthenticationManager.sharedInstance.login(email: emailTxtField.text ?? "", password: passwordTextField.text ?? "" ) { (error) in
            
            
            if let err = error {
                print(err)
                return
            }
//            print(user)
            
//            self.loginViewModel.SendLoginDetails(email: self.emailTextField.text ?? "" , pass: self.passwordTextView.text ?? "")
//
            
            
            
            
        }
    }
    
}

