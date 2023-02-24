//
//  ViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 29.12.2022.
//

import UIKit

class ViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        firstButtonStp()
        tapOrHoldStp()
        dateAndTimeStp()
        NotesButtonStp()
        photosButtonStp()
        shevchenkoBtnStp()
        constraints()
    }
    
    let tipsCalculator: MenuButton = {
        let tipsCalculator = MenuButton()
        tipsCalculator.translatesAutoresizingMaskIntoConstraints = false
        tipsCalculator.setTitle("Tips Calculator",for: .normal)
        tipsCalculator.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        tipsCalculator.layer.backgroundColor = UIColor.clear.cgColor
        tipsCalculator.setTitleColor(.black, for: .normal)
        tipsCalculator.layer.cornerRadius = 47
        tipsCalculator.layer.borderColor = UIColor.black.cgColor
        MenuButton.multiCornerRadius = 25
        tipsCalculator.titleLabel?.numberOfLines = 0
        tipsCalculator.sizeToFit()
        return tipsCalculator
    }()
    
   private func firstButtonStp(){
        view.addSubview(tipsCalculator)
       tipsCalculator.addTarget(self, action: #selector(TipsCalculatorVC), for: .touchDown)
       tipsCalculator.addTarget(self, action: #selector(unTuchFunc), for: .touchUpInside)
       tipsCalculator.addTarget(self, action: #selector(unTuchFunc), for: .touchUpOutside)
    }
        
    let tapOrHold: MenuButton = {
        let tapOrHold = MenuButton()
        tapOrHold.translatesAutoresizingMaskIntoConstraints = false
        tapOrHold.setTitle("Tap or Hold",for: .normal)
        tapOrHold.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        tapOrHold.layer.backgroundColor = UIColor.clear.cgColor
        tapOrHold.setTitleColor(.black, for: .normal)
        tapOrHold.layer.cornerRadius = 47
        tapOrHold.layer.borderColor = UIColor.black.cgColor
        MenuButton.multiCornerRadius = 25
        tapOrHold.titleLabel?.numberOfLines = 0
        tapOrHold.sizeToFit()
        return tapOrHold
    }()
    
   private func tapOrHoldStp(){
       view.addSubview(tapOrHold)
       tapOrHold.addTarget(self, action: #selector(tapOrHoldVC), for: .touchDown)
       tapOrHold.addTarget(self, action: #selector(unTuchFunc), for: .touchUpInside)
       tapOrHold.addTarget(self, action: #selector(unTuchFunc), for: .touchUpOutside)
    }
    
    let dateAndTime: MenuButton = {
        let dateAndTime = MenuButton()
        dateAndTime.translatesAutoresizingMaskIntoConstraints = false
        dateAndTime.setTitle("Date And Time",for: .normal)
        dateAndTime.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        dateAndTime.layer.backgroundColor = UIColor.clear.cgColor
        dateAndTime.setTitleColor(.black, for: .normal)
        dateAndTime.layer.cornerRadius = 47
        dateAndTime.layer.borderColor = UIColor.black.cgColor
        MenuButton.multiCornerRadius = 25
        dateAndTime.titleLabel?.numberOfLines = 0
        dateAndTime.sizeToFit()
        return dateAndTime
    }()
    
    func dateAndTimeStp(){
        view.addSubview(dateAndTime)
        dateAndTime.addTarget(self, action: #selector(dateAndTimeVC), for: .touchDown)
        dateAndTime.addTarget(self, action: #selector(unTuchFunc), for: .touchUpInside)
        dateAndTime.addTarget(self, action: #selector(unTuchFunc), for: .touchUpOutside)
    }
    let notes: MenuButton = {
        let notes = MenuButton()
        notes.translatesAutoresizingMaskIntoConstraints = false
        notes.setTitle("Notes",for: .normal)
        notes.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        notes.layer.backgroundColor = UIColor.clear.cgColor
        notes.setTitleColor(.black, for: .normal)
        notes.layer.cornerRadius = 47
        notes.layer.borderColor = UIColor.black.cgColor
        MenuButton.multiCornerRadius = 25
        notes.titleLabel?.numberOfLines = 0
        notes.sizeToFit()
        return notes
    }()
    
    func NotesButtonStp(){
        view.addSubview(notes)
        notes.addTarget(self, action: #selector(notesVC), for: .touchDown)
        notes.addTarget(self, action: #selector(unTuchFunc), for: .touchUpInside)
        notes.addTarget(self, action: #selector(unTuchFunc), for: .touchUpOutside)
    }
    let photosButton: MenuButton = {
        let photosButton = MenuButton()
        photosButton.translatesAutoresizingMaskIntoConstraints = false
        photosButton.setTitle("Photos",for: .normal)
        photosButton.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        photosButton.layer.backgroundColor = UIColor.clear.cgColor
        photosButton.setTitleColor(.black, for: .normal)
        photosButton.layer.cornerRadius = 47
        photosButton.layer.borderColor = UIColor.black.cgColor
        MenuButton.multiCornerRadius = 25
        photosButton.titleLabel?.numberOfLines = 0
        photosButton.sizeToFit()
        return photosButton
    }()
    
    func photosButtonStp(){
        view.addSubview(photosButton)
        photosButton.addTarget(self, action: #selector(photoVC), for: .touchDown)
        photosButton.addTarget(self, action: #selector(unTuchFunc), for: .touchUpInside)
        photosButton.addTarget(self, action: #selector(unTuchFunc), for: .touchUpOutside)
        
    }
    
    let shevchenkoBtn: MenuButton = {
        let shevchenkoBtn = MenuButton()
        shevchenkoBtn.translatesAutoresizingMaskIntoConstraints = false
        shevchenkoBtn.setTitle("Shevchenko",for: .normal)
        shevchenkoBtn.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        shevchenkoBtn.layer.backgroundColor = UIColor.clear.cgColor
        shevchenkoBtn.setTitleColor(.black, for: .normal)
        shevchenkoBtn.layer.cornerRadius = 47
        shevchenkoBtn.layer.borderColor = UIColor.black.cgColor
        MenuButton.multiCornerRadius = 25
        shevchenkoBtn.titleLabel?.numberOfLines = 0
        shevchenkoBtn.sizeToFit()
        return shevchenkoBtn
    }()
    
    func shevchenkoBtnStp(){
        view.addSubview(shevchenkoBtn)
        shevchenkoBtn.addTarget(self, action: #selector(shevchenkoVC), for: .touchDown)
        shevchenkoBtn.addTarget(self, action: #selector(unTuchFunc), for: .touchUpInside)
        shevchenkoBtn.addTarget(self, action: #selector(unTuchFunc), for: .touchUpOutside)
        
    }
    func constraints(){
        NSLayoutConstraint.activate([
            tipsCalculator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tipsCalculator.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            tipsCalculator.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            tipsCalculator.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            tapOrHold.topAnchor.constraint(equalTo: tipsCalculator.bottomAnchor, constant: 25),
            tapOrHold.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            tapOrHold.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            tapOrHold.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            dateAndTime.topAnchor.constraint(equalTo: tapOrHold.bottomAnchor, constant: 25),
            dateAndTime.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            dateAndTime.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            dateAndTime.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            notes.topAnchor.constraint(equalTo: dateAndTime.bottomAnchor, constant: 25),
            notes.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            notes.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            notes.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            photosButton.topAnchor.constraint(equalTo: notes.bottomAnchor, constant: 25),
            photosButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            photosButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            photosButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            shevchenkoBtn.topAnchor.constraint(equalTo: photosButton.bottomAnchor, constant: 25),
            shevchenkoBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            shevchenkoBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            shevchenkoBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
//MARK: - move to enother VC's func:
    
    @objc func TipsCalculatorVC(){

        let viewController = UINavigationController(rootViewController: TipsCalculator())
        tuchFunc(tipsCalculator)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) { [self] in
            self.unTuchFunc(tipsCalculator)
            print("Tips Calculator")
        }
    }
    
    @objc func tapOrHoldVC(){
        let viewController = UINavigationController(rootViewController: TapOrHoldVC())
        tuchFunc(tapOrHold)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) { [self] in
            self.unTuchFunc(tapOrHold)
            print("Tap or hold")
        }
    }
    
    @objc func dateAndTimeVC(){
        let viewController = UINavigationController(rootViewController: TimeAndDate())
        tuchFunc(dateAndTime)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) { [self] in
            self.unTuchFunc(dateAndTime)
            print("Time And Date")
        }
    }
    @objc func notesVC(){
        let viewController = UINavigationController(rootViewController: NotesViewController())
        viewController.modalPresentationStyle = .fullScreen
        tuchFunc(notes)
        present(viewController, animated: true) { [self] in
            self.unTuchFunc(notes)
        print("Notes")
            

            }
        }
    @objc func photoVC(){
        let viewController = UINavigationController(rootViewController: PhotosVC())
        tuchFunc(photosButton)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) { [self] in
            self.unTuchFunc(photosButton)
        print("Photos")
            }
        }
    @objc func shevchenkoVC(){
//        let viewController = UINavigationController(rootViewController: TapBarShevchento())
        let vcShevchenko = TapBarShevchento()
        tuchFunc(shevchenkoBtn)
        vcShevchenko.modalPresentationStyle = .fullScreen
        present(vcShevchenko, animated: true) { [self] in
            self.unTuchFunc(shevchenkoBtn)
        print("Shevchenko")
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
