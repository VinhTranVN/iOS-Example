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

class LoginViewController: UIViewController, DataRequestCallback {
    
    let URL_LOGIN = "http://595df587d7210a0011ddabc6.mockapi.io/api/login"
    
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var lbErrorMsg: UILabel!
    
    var alertController: UIAlertController?
    
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
        
        alertController = UIAlertController(title: nil, message: "Please wait\n\n", preferredStyle: .alert)
        
        // init spinnerIndicator
        let spinnerIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
        spinnerIndicator.color = UIColor.black
        spinnerIndicator.startAnimating()
        
        alertController?.view.addSubview(spinnerIndicator)
        
        if userName.text == "vinh", password.text == "123" {
            // show progress dialog
            self.present(alertController!, animated: false, completion: nil)
            DataLoaderUtil.requestGET(URL_LOGIN, callBack: self)
            
        } else {
            // show error
            lbErrorMsg.text = "Wrong username or password"
        }
    }
    
    func hideLoadingDialog(_ alertController: UIAlertController!){
        alertController.dismiss(animated: true, completion: nil);
    }
 
    func onFailure() {
        print("got an error creating the request")
        self.hideLoadingDialog(alertController);
    }
    
    func onSuccess(jsonData data: JSON) {
        if let isSuccess = data["success"].bool {
            print("isSuccess: \(isSuccess)")
            if isSuccess {
                let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                mainVC.mUserName = data["full_name"].stringValue
                
                self.navigationController?.show(mainVC, sender: nil)
            } else{
                self.lbErrorMsg.text = "Login false"
            }
        }
        
        self.hideLoadingDialog(alertController);

    }
}
