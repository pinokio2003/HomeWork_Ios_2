//
//  AddEditButton.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 07.02.2023.
//

import UIKit

class AddEditButton: UIButton{
    
    let buttonEdit = UIButton()

//MARK: - image for button:
    var swimbol: UIImageView = {
        let image = UIImage(systemName: "staroflife")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor.black
       return imageView
    }()
    
//MARK: - Init:
    override init(frame: CGRect) {
        super.init(frame: frame)
//MARK: - Edit button in init
    
        self.setImage(swimbol.image, for: .normal)
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
