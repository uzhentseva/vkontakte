//
//  FriendPhotoAvatar.swift
//  vkontakte
//
//  Created by Uzh on 21/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class FriendPhotoAvatar: UIImageView {

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.white.cgColor
        
        self.layer.cornerRadius = self.frame.size.width / 2
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
    }

}
