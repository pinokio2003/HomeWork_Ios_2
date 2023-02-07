//
//  LocationButton.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 07.02.2023.
//

import UIKit

class FindButton: UIButton {
    let findButton = UIButton()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("Find my location", for: .normal)
        self.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        self.setTitleColor(.black, for: .normal)
        self.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
