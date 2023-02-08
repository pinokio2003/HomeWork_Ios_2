//
//  Images.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 05.01.2023.
//

import UIKit

class Images: UICollectionViewCell {
    static let identifire = "Images"
    
    let planets = planetImages
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
   //     imageView.image = nil
    }
}
