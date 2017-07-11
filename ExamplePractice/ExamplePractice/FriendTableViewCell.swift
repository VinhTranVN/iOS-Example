//
//  FriendTableViewCell.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/11/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mImgPhotoView: UIImageView!
    
    @IBOutlet weak var mUserNameView: UILabel!
    
    @IBOutlet weak var mFullNameView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
