//
//  NewLikeButton.swift
//  vkontakte
//
//  Created by Uzh on 06/02/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class NewLikeButton: UIControl {
    
    var counter: Int = 10
    
    var isLiked: Bool = false {
        didSet {
            self.update()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private weak var iconImageView: UIImageView?
    private weak var countLabel: UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setAppearance()
        self.addSubviews()
        self.addGestures()
        self.update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setAppearance()
        self.addSubviews()
        self.addGestures()
        self.update()
    }
    
    private func addGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
        
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction(tap: UITapGestureRecognizer) {
        print("tapGesture")
        
        self.isLiked = !self.isLiked
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 1.5
        animation.fillMode = CAMediaTimingFillMode.backwards
        iconImageView?.layer.add(animation, forKey: nil)
        
    }
    
    private func setAppearance() {
        self.backgroundColor = UIColor.clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.iconImageView?.frame = CGRect(x: 0,
                                           y: 0,
                                           width: self.frame.size.width / 2,
                                           height: self.frame.size.height)
        
        self.countLabel?.frame = CGRect(x: self.frame.size.width / 2,
                                           y: 0,
                                           width: self.frame.size.width / 2,
                                           height: self.frame.size.height)
    }
    
    
    private func addSubviews() {
        self.addIconImageView()
        self.addCountLabel()
    }
    
    private func addIconImageView() {
        if nil != self.iconImageView {
            return
        }
        
        let iconImageView = UIImageView()
        
        self.addSubview(iconImageView)
        self.iconImageView = iconImageView
    }
    
    private func addCountLabel() {
        if nil != self.countLabel {
            return
        }
        
        let countLabel = UILabel()
        
        //countLabel.textAlignment = center
        countLabel.font = UIFont.systemFont(ofSize: 25)
        
        self.addSubview(countLabel)
        self.countLabel = countLabel
    }
    
    
    
    
    
    private func update() {
        self.updateIconImageView()
        self.updateCountLabel()
        
    }
    
    private func updateIconImageView() {
        
        let iconImage = self.isLiked ? "likeblack" : "like"
        let image = UIImage(named: iconImage)
        self.iconImageView?.image = image
        
    }
    
    
    private func updateCountLabel() {
        
        let textColor: UIColor = self.isLiked ? .red : .gray
        self.countLabel?.textColor = textColor
        
        if self.isLiked {
            self.counter += 1
        } else {
            self.counter -= 1
        }
        
        self.countLabel?.text = "\(self.counter)"
        
    }
    
    
}
