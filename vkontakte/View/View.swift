//
//  View.swift
//  vkontakte
//
//  Created by Uzh on 06/02/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class View: UIViewController {
    
    @IBOutlet weak var newLike: NewLikeButton?
    
    @IBAction func likeButtonChanged() {
        print("likeButtonChanged")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAppearance()
    }

    private func setAppearance() {
        self.view.backgroundColor = UIColor.white
    }
    
}
