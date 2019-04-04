//
//  slideTableViewCell.swift
//  MavRick
//
//  Created by Yash Nayak on 21/11/18.
//  Copyright © 2018 inspire. All rights reserved.
//

import UIKit

class slideTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mymenu: UIImageView!
    @IBOutlet weak var mylbl:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
