//
//  UIViewExtensiosn.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import UIKit

extension UIView{
    
    func centerX(of parent: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint.init(item: self,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: parent,
                                              attribute: .centerX,
                                              multiplier: 1,
                                              constant: 0)
        parent.addConstraint(centerX)
    }
    
    func centerY(of parent: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint.init(item: self,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: parent,
                                              attribute: .centerY,
                                              multiplier: 1,
                                              constant: 0)
        parent.addConstraint(centerX)
    }
    
    func centerParent(of parent: UIView){
        centerX(of: parent)
        centerY(of: parent)
    }
}
