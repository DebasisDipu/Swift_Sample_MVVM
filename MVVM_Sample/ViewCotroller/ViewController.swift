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
    
    var user : User?
    
    @IBOutlet weak var companyLbl: UILabel!
   private var ViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let server_url = Environment().configuration(PlistKey.ServerURL)
        print(server_url)
        
        if let user = user?.id{
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DidTapLoginButton(_ sender: Any) {
        
        
        
        
        ViewModel.GetUserLogin(emailTxtField: emailTxtField.text ?? "", passwordTextField: passwordTextField.text ?? "") { (error, userResponse, sample) in
            if error != nil{
                return
            }
            
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectedCompanyViewController") as! SelectedCompanyViewController
            nextVC.companyDelegate = self
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        }

    }
    
}
extension ViewController: SelectedCompanyDelegate {
    
    func DidSelectButton(_ company: String) {

            companyLbl.text = company

    }
}

