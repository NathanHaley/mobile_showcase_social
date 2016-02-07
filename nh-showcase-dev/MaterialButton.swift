//
//  MaterialButton.swift
//  nh-showcase-dev
//
//  Created by user4355 on 11/21/15.
//  Copyright © 2015 blah. All rights reserved.
//

import UIKit
//external xib file, will update storyboard with styles realtime
//@IBDesignable

class MaterialButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }

}