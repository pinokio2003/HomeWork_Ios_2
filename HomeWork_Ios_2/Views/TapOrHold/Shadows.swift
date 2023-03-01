//
//  Shadows.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 17.02.2023.
//

import UIKit

class LableShadow: UIButton{
     
    var buttonStile = UIButton()
    static var multiCornerRadius: CGFloat = 0
    
    let darkShadow = CALayer()
    let lightShadow = CALayer()
    
    
    func takeMultiCornerRadius(_ multiCornerRadius: CGFloat) -> CGFloat{
        let multi = multiCornerRadius
        return multi
    }
  
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonStile)
        
        darkShadow.needsDisplayOnBoundsChange = true
        darkShadow.shadowColor = UIColor.black.cgColor
        darkShadow.shadowOffset = CGSize(width: 10, height: 10)
        darkShadow.shadowRadius = 10
        darkShadow.shadowOpacity = 0.15
        darkShadow.cornerRadius = 10
        darkShadow.backgroundColor = UIColor.customBackgroundColor.cgColor
             
        lightShadow.needsDisplayOnBoundsChange = true
        lightShadow.shadowColor = UIColor.white.cgColor
        lightShadow.shadowOffset = CGSize(width: -7, height: -7)
        lightShadow.shadowRadius = 10
        lightShadow.shadowOpacity = 0.5
        lightShadow.cornerRadius = 10
        lightShadow.backgroundColor = UIColor.customBackgroundColor.cgColor
            
        buttonStile.setTitle("Start", for: .normal)
        buttonStile.backgroundColor = .customBackgroundColor
        buttonStile.frame = self.bounds
        buttonStile.layer.cornerRadius = takeMultiCornerRadius(MenuButton.multiCornerRadius)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        buttonStile.layer.insertSublayer(darkShadow, at: 0)
        buttonStile.layer.insertSublayer(lightShadow, at: 0)
        darkShadow.cornerRadius = takeMultiCornerRadius(MenuButton.multiCornerRadius)
        lightShadow.cornerRadius = takeMultiCornerRadius(MenuButton.multiCornerRadius)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - layout subview
    
    override func layoutSubviews() {
        super.layoutSubviews()
        darkShadow.frame = self.bounds
        lightShadow.frame = self.bounds
        darkShadow.cornerRadius = takeMultiCornerRadius(MenuButton.multiCornerRadius)
        lightShadow.cornerRadius = takeMultiCornerRadius(MenuButton.multiCornerRadius)
    }


}
