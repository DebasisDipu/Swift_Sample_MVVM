//
//  SelectedCompanyViewController.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 11/09/18.
//  Copyright © 2018 P10. All rights reserved.
//

import UIKit

protocol SelectedCompanyDelegate {
    func DidSelectButton(_ company: String)
}

class SelectedCompanyViewController: UIViewController {
    
    var companyDelegate: SelectedCompanyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CompanyDelected(_ sender: UIButton){
        
        guard let textName = sender.titleLabel?.text else{
            return
        }
        if let delegate = companyDelegate {
            delegate.DidSelectButton(textName)
        }        
    }
    
}
