//
//  LoginViewController.swift
//  SampleCoreDataProj
//
//  Created by p10macdev06 on 31/07/18.
//  Copyright © 2018 P10. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, GetLoginAllDelegate {

    
    let loginViewModel = LoginViewModel()
    
    
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    @IBAction func DidTapLoginButton(_ sender: Any) {
        
        
        AuthenticationManager.sharedInstance.login(email: emailTextField.text ?? "", password: emailTextField.text ?? "" ) { (error, user) in
            
            
            if let err = error {
                print(error)
                return
            }
            print(user)
            
            self.loginViewModel.SendLoginDetails(email: self.emailTextField.text ?? "" , pass: self.passwordTextView.text ?? "")
         
        }
     
    }
    
    @IBOutlet weak var DidTapLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        // Do any additional setup after loading the view.
    }
    
    func LoginDetails( didLoginWithEmail email: String, pass: String) {
        print(email + "" + pass)
    }

    

}




