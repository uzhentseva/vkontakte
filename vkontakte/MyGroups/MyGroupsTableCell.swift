//
//  MyGroupsTableCell.swift
//  vkontakte
//
//  Created by Uzh on 10/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class MyGroupsTableCell: UITableViewCell {

    @IBOutlet weak var MyGroupLable: UILabel!
    @IBOutlet weak var MyGroupImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
