
//  LikeButton.swift
//  vkontakte
//
//  Created by Uzh on 04/02/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class LikeButton: UIButton {

    var isOn = false
   // var button = LikeButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        setTitleColor(UIColor.gray, for: .normal)
        addTarget(self, action: #selector(LikeButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
       //let color = bool ? UIColor.clear : .clear
        let title = bool ? "♥️1" : "💙0"
        let titleColor = bool ? UIColor.red : UIColor.gray
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        //backgroundColor = color
    }

}
