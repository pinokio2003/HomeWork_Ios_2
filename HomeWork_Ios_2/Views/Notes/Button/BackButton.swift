//
//  BackButton.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.01.2023.
//

import UIKit

class BackButton: UIButton {
    let backButton = UIButton()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("Back", for: .normal)
        self.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        self.setTitleColor(.black, for: .normal)
        self.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
