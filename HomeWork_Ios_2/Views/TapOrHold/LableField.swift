//
//  ViewField.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 16.02.2023.
//

import UIKit

class LableInnerShadow: UILabel {
    
    lazy var innerShadow: CALayer = {
        let innerShadow = CALayer()
        layer.addSublayer(innerShadow)
        return innerShadow
    }()
    
   //MARK: - LayoutSubview
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyDesign()
        
    }
//MARK: - Inner Shdow setup
    func applyDesign() {
        innerShadow.frame = bounds
        
        // Shadow path (1pt ring around bounds)
        let radius = self.frame.size.height
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -4, dy: -4), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()
        
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        
        // Shadow properties
        innerShadow.shadowColor = UIColor.darkGray.cgColor
        innerShadow.shadowOffset = CGSize(width: 1, height: 4)
        innerShadow.shadowOpacity = 1
        innerShadow.shadowRadius = 4
        innerShadow.cornerRadius = self.frame.size.height/2
        
    }
}
