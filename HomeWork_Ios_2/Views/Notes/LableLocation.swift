//
//  LableLocation.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 07.02.2023.
//

import UIKit

class LableLocation: UILabel {
    let lbl = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = "Location"
        self.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        self.numberOfLines = 0
        self.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
