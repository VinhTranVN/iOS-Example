//
//  LoginViewController.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/4/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class LoginViewController: UIViewController {
    
    let URL_LOGIN = "http://595df587d7210a0011ddabc6.mockapi.io/api/login"
    
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var lbErrorMsg: UILabel!
    
    var alertController = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alertController = UIAlertController(title: nil, message: "Please wait\n\n", preferredStyle: .alert)
        
        // init spinnerIndicator
        let spinnerIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
        spinnerIndicator.color = UIColor.black
        spinnerIndicator.startAnimating()
        
        alertController.view.addSubview(spinnerIndicator)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print(">>> LoginViewController didReceiveMemoryWarning")
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        print(">>> LoginViewController doLogin")
        
        if userName.text == "vinh", password.text == "123" {
            // show progress dialog
            self.present(alertController, animated: false, completion: nil)

            do {
                let opt = try HTTP.GET(URL_LOGIN)
                opt.start { response in
                    if let err = response.error {
                        print(">>> error: \(err.localizedDescription)")
                        return //also notify app of failure as needed
                    }
                    print(">>> opt finished:\n \(response.description)")
                    let data = JSON(response.data)
                    if let isSuccess = data["success"].bool {
                        print("isSuccess: \(isSuccess)")
                        DispatchQueue.main.async {
                            if isSuccess {
                                let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                                mainVC.mUserName = data["full_name"].stringValue
                                
                                self.navigationController?.show(mainVC, sender: nil)
                            } else{
                                self.lbErrorMsg.text = "Login false"
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.alertController.dismiss(animated: true, completion: nil);
                    }
                }
            } catch let error {
                print("got an error creating the request: \(error)")
                alertController.dismiss(animated: true, completion: nil);
            }
            
        } else {
            // show error
            lbErrorMsg.text = "Wrong username or password"
        }
    }
    
}
