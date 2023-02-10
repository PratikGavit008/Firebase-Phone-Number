//
//  Extensions.swift
//  Firebase Phone Number
//
//  Created by Pratik Gavit on 10/02/23.
//

import UIKit
extension UIView {
   
        func addCornerRad() {
            self.layer.cornerRadius = 50
            self.layer.masksToBounds = true

            self.layer.contentsScale = UIScreen.main.scale
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
            self.layer.shadowRadius = 5.0
            self.layer.shadowOpacity = 0.5
            self.layer.masksToBounds = false
            self.clipsToBounds = false
        
    }
}
