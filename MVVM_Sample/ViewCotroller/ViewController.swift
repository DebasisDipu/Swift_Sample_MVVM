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
    
    var ViewModel = LoginViewModel()
    
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
        
        let loginDetails = ViewModel.GetUserLogin(emailTxtField: emailTxtField.text ?? "", passwordTextField: passwordTextField.text ?? "")
       
            print(loginDetails)
        
//            self.loginViewModel.SendLoginDetails(email: self.emailTextField.text ?? "" , pass: self.passwordTextView.text ?? "")
//
            
            
            
            
    
    }
    
}

