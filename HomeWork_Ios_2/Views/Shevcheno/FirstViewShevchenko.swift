//
//  FirstViewShevchenko.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 23.02.2023.
//

import UIKit

class FirstViewShevchenko: UIView{
    
    let lableFirst = UILabel()
    let lableSecond = UILabel()
    
    let mySubview: ViewShadowShevchenko = {
        let view = ViewShadowShevchenko()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - Init:
    override init(frame: CGRect) {
        super.init(frame: frame)
        lablelFirstSetup()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.lablelSecondSetup()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - lable setup
    func lablelFirstSetup(){
        addSubview(lableFirst)
        lableFirst.translatesAutoresizingMaskIntoConstraints = false
        lableFirst.text = firstHalfVerse
        lableFirst.textAlignment = .center
        lableFirst.numberOfLines = 0
        lableFirst.font = UIFont(name: "SnellRoundhand-Black", size: 25)
        //настройка высоту строк в лейбле :
        let attributedString = NSMutableAttributedString(string: lableFirst.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        lableFirst.attributedText = attributedString
        
        NSLayoutConstraint.activate([
            lableFirst.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            lableFirst.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            lableFirst.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            //greaterThanOrEqualToConstant - означает что высота будет не менее 40 но может быть больше в зависимости от контекста
            
        ])
    }
    
    func lablelSecondSetup(){
        addSubview(lableSecond)
        lableSecond.translatesAutoresizingMaskIntoConstraints = false
        lableSecond.text = secondHalfVerse
        lableSecond.textAlignment = .center
        lableSecond.numberOfLines = 0
        lableSecond.font = UIFont(name: "SnellRoundhand-Black", size: 25)
        
        let attributedString = NSMutableAttributedString(string: lableSecond.text!)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        lableSecond.attributedText = attributedString
        
        NSLayoutConstraint.activate([
            lableSecond.topAnchor.constraint(equalTo: lableFirst.bottomAnchor,constant: 10),
            lableSecond.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            lableSecond.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
        
    }
}
