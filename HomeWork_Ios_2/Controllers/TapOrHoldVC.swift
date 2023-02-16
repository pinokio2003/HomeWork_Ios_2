//
//  ViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.12.2022.
//


import UIKit

class TapOrHoldVC: UIViewController {
    
    
    var buttonReset = UIButton()
    var buttonDismiss = UIButton()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        runMethods()
    }
    
    //Methods run
    func runMethods(){
        lableSettings()
        buttonStartSettings()
        resetButtonSettings()
        buttonDismissSettings()
        constraines()
   
    }
    
    // MARK: lable:
    
    let lable: LableInnerShadow = {
        let lable = LableInnerShadow()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont(name: "AvenirNext-Regular" ,size: 25)
        lable.textAlignment = .center
        
        
        return lable
    }()
    
    func lableSettings(){
        lable.text = "\(num)"
        view.addSubview(lable)
    }
    
    //MARK: buttons:
    //maine button
    
    let buttonStart: MenuButton = {
        let buttonStart = MenuButton()
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.setTitle("""
                               TAP
                               OR
                             HOLD
                            """,for: .normal)
        buttonStart.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 25)
        buttonStart.layer.backgroundColor = UIColor.clear.cgColor
        buttonStart.setTitleColor(.darkText, for: .normal)
        buttonStart.layer.cornerRadius = 0
        buttonStart.layer.borderColor = UIColor.black.cgColor
        MenuButton.multiCornerRadius = 70
        buttonStart.titleLabel?.numberOfLines = 0
        buttonStart.sizeToFit()
        return buttonStart
    }()
    
    func buttonStartSettings(){

        buttonStart.addTarget(self, action: #selector(timerStart), for: .touchDown)
        buttonStart.addTarget(self, action: #selector(timerStop), for: .touchUpInside)
        buttonStart.addTarget(self, action: #selector(timerStop), for: .touchUpOutside)
        buttonStart.addTarget(self, action: #selector(simpleTuch), for: .touchUpInside)
        view.addSubview(buttonStart)
    }
        //button reset
    func resetButtonSettings(){
        buttonReset.translatesAutoresizingMaskIntoConstraints = false
        buttonReset.setTitle("Reset", for: .normal)
        buttonReset.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        buttonReset.setTitleColor(.black, for: .normal)
        buttonReset.sizeToFit()
        buttonReset.addTarget(self, action: #selector(reset), for: .touchUpInside)
        view.addSubview(buttonReset)
       
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
        
        
    //MARK: Constraines:
    func constraines(){
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lable.widthAnchor.constraint(equalToConstant: 90),
            lable.heightAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            buttonStart.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 40),
            buttonStart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStart.widthAnchor.constraint(equalToConstant: 140),
            buttonStart.heightAnchor.constraint(equalToConstant: 140)
        ])
        NSLayoutConstraint.activate([
            buttonReset.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonReset.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            buttonReset.heightAnchor.constraint(equalToConstant: 10)
        ])
        NSLayoutConstraint.activate([
            buttonDismiss.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonDismiss.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            buttonDismiss.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    // MARK: timerSettings + objc methods
    var num = 0
    var timer = Timer()
    
    //timer setup
    @objc func timerStart(){

        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(second), userInfo: nil, repeats: true)
        tuchFunc(buttonStart)
    }
    
    @objc func simpleTuch(){
        num += 1
        lable.text = "\(num)"
        unTuchFunc(buttonStart)
    }
    @objc func timerStop(){
        unTuchFunc(buttonStart)
        timer.invalidate()
    }
    
    @objc func second(){
        num += 1
        lable.text = "\(num)"
        print(num)
        
    }
    @objc func reset(){
        timer.invalidate()
        num = 0
        lable.text = "\(num)"
    }
    //Dismiss button
    @objc func backFunc(){
       let viewcontroller = ViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true) {
            print("Back to main")
        }
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
