//
//  LoginViewController.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/4/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var lbErrorMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print(">>> LoginViewController didReceiveMemoryWarning")
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        print(">>> LoginViewController doLogin")
        
        if userName.text == "vinh", password.text == "123" {
            let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            mainVC.mUserName = userName.text!
            
            navigationController?.show(mainVC, sender: nil)
        } else {
            // show error
            lbErrorMsg.text = "Wrong username or password"
        }
    }
    
}
