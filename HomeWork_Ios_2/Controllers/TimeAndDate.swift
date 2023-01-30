//
//  TimeAndData.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.12.2022.
//

import UIKit

class TimeAndDate: UIViewController {
    
    let lableDate = UILabel()
    let lableTime = UILabel()
    let resetButton = UIButton()
    let date = Date()
    var timer = Timer()
    var buttonDismiss = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButtonSetup()
        labelDateSetup()
        labelTimeSetup()
        buttonDismissSettings()
        constraintsSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
    }

    //MARK: - setup Views:
    //Setup label_Data
    func labelDateSetup(){
        view.addSubview(lableDate)
        lableDate.translatesAutoresizingMaskIntoConstraints = false
        lableDate.font = UIFont(name: "GillSans-Italic" ,size: 45)
        lableDate.text = dateSetup()
        lableDate.textAlignment = .center
        lableDate.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)}
    
    
    func labelTimeSetup(){
        view.addSubview(lableTime)
        lableTime.translatesAutoresizingMaskIntoConstraints = false
        lableTime.text = timeSetup()
        lableTime.font = UIFont(name: "GillSans-Italic" ,size: 45)
        lableTime.textAlignment = .center
        lableTime.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
    }
    // Setup buttons data
    func resetButtonSetup(){
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle("Refresh", for: .normal)
        resetButton.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        resetButton.layer.backgroundColor = UIColor.clear.cgColor
        resetButton.setTitleColor(.black, for: .normal)
        resetButton.layer.cornerRadius = 47
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.shadowColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 0.5).cgColor
        resetButton.layer.shadowOpacity = 1
        resetButton.layer.shadowRadius = 15
        resetButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        resetButton.titleLabel?.numberOfLines = 0
        resetButton.sizeToFit()
        resetButton.frame = CGRect(x: 10, y: 10, width: 90, height: 90)
        resetButton.addTarget(self, action: #selector(second), for: .touchDown)
        
        view.addSubview(resetButton)
    }
    func buttonDismissSettings(){
        buttonDismiss.translatesAutoresizingMaskIntoConstraints = false
        buttonDismiss.setTitle("Dismiss", for: .normal)
        buttonDismiss.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        buttonDismiss.setTitleColor(.black, for: .normal)
        buttonDismiss.sizeToFit()
        buttonDismiss.addTarget(self, action: #selector(backFunc), for: .touchUpInside)
        view.addSubview(buttonDismiss)
    }
    
    
    //MARK: - Constraints:
    
    func constraintsSetup(){
        
        NSLayoutConstraint.activate([
            lableDate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            lableDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            lableDate.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            lableDate.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            lableTime.topAnchor.constraint(equalTo: lableDate.bottomAnchor),
            lableTime.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            lableTime.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            lableTime.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: lableTime.bottomAnchor),
            resetButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -15),
            resetButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 15),
            resetButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            buttonDismiss.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonDismiss.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            buttonDismiss.heightAnchor.constraint(equalToConstant: 10)
        ])
 
    }

}
