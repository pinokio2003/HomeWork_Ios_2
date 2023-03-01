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
    let date = Date()
    var timer = Timer()
    var buttonDismiss = UIBarButtonItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        title = "Date and Time"
        addChildVC()
        resetButtonSetup()
        
        labelDateSetup()
        labelTimeSetup()
        buttonDismissSettings()
        constraintsSetup()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }

    //MARK: - setup Views:
    //Setup label_Data
    func labelDateSetup(){
        view.addSubview(lableDate)
        lableDate.translatesAutoresizingMaskIntoConstraints = false
        lableDate.font = UIFont(name: "GillSans-Italic" ,size: 45)
        lableDate.text = dateSetup()
        lableDate.textAlignment = .center
        lableDate.backgroundColor = .customBackgroundColor}
    
    
    func labelTimeSetup(){
        view.addSubview(lableTime)
        lableTime.translatesAutoresizingMaskIntoConstraints = false
        lableTime.text = timeSetup()
        lableTime.font = UIFont(name: "GillSans-Italic" ,size: 45)
        lableTime.textAlignment = .center
        lableTime.backgroundColor = .customBackgroundColor
    }
    // Setup buttons data
    
    
    let resetButton: MenuButton = {
    let resetButton = MenuButton()
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle("Reset timer",for: .normal)
        resetButton.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        resetButton.layer.backgroundColor = UIColor.clear.cgColor
        resetButton.setTitleColor(.black, for: .normal)
        resetButton.layer.cornerRadius = 47
        resetButton.layer.borderColor = UIColor.black.cgColor
        MenuButton.multiCornerRadius = 25
        resetButton.titleLabel?.numberOfLines = 0
        resetButton.sizeToFit()
        return resetButton
    }()
    
    
    func resetButtonSetup(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(cancelTimer), for: .touchDown)
        resetButton.addTarget(self, action: #selector(unTuchFunc), for: .touchUpInside)
        
        
    }
    func buttonDismissSettings(){
        buttonDismiss.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Copperplate-Bold" ,size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .normal)
        buttonDismiss.title = "Dismiss"
        buttonDismiss.target = self
        buttonDismiss.action = #selector(backFunc)
    }
    func addChildVC(){
        let navVC = UINavigationController()
        view.addSubview(navVC.view)
        navigationItem.leftBarButtonItem = buttonDismiss
        buttonDismissSettings()
    }
    
    
    //MARK: - Constraints:
    
    func constraintsSetup(){
        
        NSLayoutConstraint.activate([
            lableDate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            lableDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            lableDate.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            lableDate.heightAnchor.constraint(equalToConstant: 50),

            lableTime.topAnchor.constraint(equalTo: lableDate.bottomAnchor),
            lableTime.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            lableTime.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            lableTime.heightAnchor.constraint(equalToConstant: 50),

            resetButton.topAnchor.constraint(equalTo: lableTime.bottomAnchor,constant: 20),
            resetButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            resetButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -50),
            resetButton.heightAnchor.constraint(equalToConstant: 50)
        ])
 
    }
    //MARK: - Изменение настроек для анимации кнопки:
    @objc func tuchFunc(_ sender: MenuButton){
        sender.darkShadow.shadowOffset = CGSize(width: -7, height: -7)
        sender.lightShadow.shadowOffset = CGSize(width: 10, height: 10)
        sender.darkShadow.shadowOpacity = 0.15
        sender.lightShadow.shadowOpacity = 0.5
    }
    @objc func unTuchFunc(_ sender: MenuButton){
        sender.darkShadow.shadowOffset = CGSize(width: 10, height: 10)
        sender.lightShadow.shadowOffset = CGSize(width: -7, height: -7)
        sender.darkShadow.shadowOpacity = 0.15
        sender.lightShadow.shadowOpacity = 0.5
    }
    
}
