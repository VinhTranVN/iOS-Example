//
//  MainViewController.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/4/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var lbUserName: UILabel!
    
    var mUserName: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(">>> viewDidLoad \(mUserName!)")
        lbUserName.text = mUserName!;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print(">>> didReceiveMemoryWarning")
    }
}
