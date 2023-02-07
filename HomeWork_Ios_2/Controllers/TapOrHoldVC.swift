//
//  ViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.12.2022.
//


import UIKit

class TapOrHoldVC: UIViewController {
    
    var lable = UILabel()
    var buttonStart = UIButton()
    var buttonReset = UIButton()
    var buttonDismiss = UIButton()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
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
    
    // MARK: lable settings:
    func lableSettings(){
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "\(num)"
        lable.font = UIFont(name: "GillSans-Italic" ,size: 45)
        lable.textAlignment = .center
        lable.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        view.addSubview(lable)
    }
    //MARK: buttons:
    //maine button
    func buttonStartSettings(){
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.configuration = .bordered()
        buttonStart.setTitle("""
                              TAP
                              OR
                              HOLD
                             """,
                             for: .normal)
        buttonStart.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        buttonStart.layer.backgroundColor = UIColor.clear.cgColor
        buttonStart.setTitleColor(.black, for: .normal)
        buttonStart.layer.cornerRadius = 47
        buttonStart.layer.borderColor = UIColor.black.cgColor
        
        buttonStart.layer.shadowColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 0.5).cgColor
        buttonStart.layer.shadowOpacity = 1
        buttonStart.layer.shadowRadius = 15
        buttonStart.layer.shadowOffset = CGSize(width: 10, height: 10)
        buttonStart.titleLabel?.numberOfLines = 0
        buttonStart.sizeToFit()
        
        //buttonStart.backgroundColor = .white
        buttonStart.addTarget(self, action: #selector(timerStart), for: .touchDown)
        buttonStart.addTarget(self, action: #selector(timerStop), for: .touchUpInside)
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
            lable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),
            lable.widthAnchor.constraint(equalToConstant: 90),
            lable.heightAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            buttonStart.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 40),
            buttonStart.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),
            buttonStart.widthAnchor.constraint(equalToConstant: 112),
            buttonStart.heightAnchor.constraint(equalToConstant: 112)
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
    }
    @objc func simpleTuch(){
        num += 1
        lable.text = "\(num)"
    }
    @objc func timerStop(){
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
}
