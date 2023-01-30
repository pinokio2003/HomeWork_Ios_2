//
//  TimeAndDateCell.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 06.01.2023.
//

import UIKit

class TimeAndDateCell: UITableViewCell {
    
    let lableTime = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "Cell")
        lableTime.text = "Some text"
        contentView.addSubview(lableTime)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        lableTime.frame = CGRect(x: 1,
                                 y: 1,
                                 width: bounds.width,
                                 height: bounds.height)
    }
    func setData(text: String){
        lableTime.text = text
    }
    
}
