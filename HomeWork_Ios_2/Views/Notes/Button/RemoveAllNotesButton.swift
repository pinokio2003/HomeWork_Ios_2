//
//  RemoveAllNotesButton.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 07.02.2023.
//

import Foundation

import UIKit

class RemoveAllButton: UIButton{
    
    let buttonRemove = UIButton()
    
    var swimbol: UIImageView = {
        let image = UIImage(systemName: "plus.app")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor.black
       return imageView
    }()
    
//MARK: - Init:
    override init(frame: CGRect) {
        super.init(frame: frame)
//MARK: - Edit button in init
    
        self.setImage(swimbol.image, for: .normal)
//        self.setTitle("remove all", for: .normal)
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
