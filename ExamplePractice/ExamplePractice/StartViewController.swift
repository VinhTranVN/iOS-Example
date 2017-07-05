//
//  ViewController.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 6/30/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var mTextInput: UITextField!
    @IBOutlet weak var mSwitchRole: UISwitch!
    @IBOutlet weak var mRoleName: UILabel!
    
    var textSend: String! = ""
    var isMember: Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(">>> viewDidLoad")
        onSwitchRoleChanged(mSwitchRole)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print(">>> didReceiveMemoryWarning")
    }

    @IBAction func onSwitchRoleChanged(_ sender: UISwitch) {
        if sender.isOn {
            mRoleName.text = "I am member"
            isMember = true
        } else {
            mRoleName.text = "I am guest"
            isMember = false
        }
    }
    
    @IBAction func btnGoToMain(_ sender: UIButton) {
        if isMember {
            self.performSegue(withIdentifier: "gotoLoginSegue", sender: nil)
        } else {
            self.performSegue(withIdentifier: "gotoRegisterSegue", sender: nil)
        }
    }
    
}

