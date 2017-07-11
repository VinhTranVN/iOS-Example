//
//  Friend.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/11/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//

import UIKit

class Friend {
    var userName: String
    var fullName: String
    var photoUrl: String?
    var photoImageView: UIImage?
    
    //MARK: Initialization
    init?(userName: String, fullName: String, photoUrl: String?, photoView: UIImage?) {
        
        if userName.isEmpty {
            return nil
        }
        
        self.userName = userName
        self.fullName = fullName
        self.photoUrl = photoUrl
        self.photoImageView = photoView
    }
}
