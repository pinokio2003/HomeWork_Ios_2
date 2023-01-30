//
//  ViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 29.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let firstButton = UIButton()
    let tapOrHold = UIButton()
    let dateAndTime = UIButton()
    let notes = UIButton()
    let photosButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        firstButtonStp()
        tapOrHoldStp()
        dateAndTimeStp()
        NotesButtonStp()
        photosButtonStp()
        constraints()
    }
    
    func firstButtonStp(){
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.setTitle("Tips Calculator",for: .normal)
        firstButton.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        firstButton.layer.backgroundColor = UIColor.clear.cgColor
        firstButton.setTitleColor(.black, for: .normal)
        firstButton.layer.cornerRadius = 47
        firstButton.layer.borderColor = UIColor.black.cgColor
        firstButton.layer.shadowColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 0.5).cgColor
        firstButton.layer.shadowOpacity = 1
        firstButton.layer.shadowRadius = 15
        firstButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        firstButton.titleLabel?.numberOfLines = 0
        firstButton.sizeToFit()
        firstButton.addTarget(self, action: #selector(TipsCalculatorVC), for: .touchUpInside)
        view.addSubview(firstButton)
    }
    func tapOrHoldStp(){
        tapOrHold.translatesAutoresizingMaskIntoConstraints = false
        tapOrHold.setTitle("Tap of Hold",for: .normal)
        tapOrHold.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        tapOrHold.layer.backgroundColor = UIColor.clear.cgColor
        tapOrHold.setTitleColor(.black, for: .normal)
        tapOrHold.layer.cornerRadius = 47
        tapOrHold.layer.borderColor = UIColor.black.cgColor
        tapOrHold.layer.shadowColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 0.5).cgColor
        tapOrHold.layer.shadowOpacity = 1
        tapOrHold.layer.shadowRadius = 15
        tapOrHold.layer.shadowOffset = CGSize(width: 10, height: 10)
        tapOrHold.titleLabel?.numberOfLines = 0
        tapOrHold.sizeToFit()
        tapOrHold.addTarget(self, action: #selector(tapOrHoldVC), for: .touchUpInside)
        view.addSubview(tapOrHold)
    }
    func dateAndTimeStp(){
        dateAndTime.translatesAutoresizingMaskIntoConstraints = false
        dateAndTime.setTitle("Date And Time",for: .normal)
        dateAndTime.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        dateAndTime.layer.backgroundColor = UIColor.clear.cgColor
        dateAndTime.setTitleColor(.black, for: .normal)
        dateAndTime.layer.cornerRadius = 47
        dateAndTime.layer.borderColor = UIColor.black.cgColor
        dateAndTime.layer.shadowColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 0.5).cgColor
        dateAndTime.layer.shadowOpacity = 1
        dateAndTime.layer.shadowRadius = 15
        dateAndTime.layer.shadowOffset = CGSize(width: 10, height: 10)
        dateAndTime.titleLabel?.numberOfLines = 0
        dateAndTime.sizeToFit()
        dateAndTime.addTarget(self, action: #selector(dateAndTimeVC), for: .touchUpInside)
        view.addSubview(dateAndTime)
    }
    func NotesButtonStp(){
        notes.translatesAutoresizingMaskIntoConstraints = false
        notes.setTitle("Notes",for: .normal)
        notes.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        notes.layer.backgroundColor = UIColor.clear.cgColor
        notes.setTitleColor(.black, for: .normal)
        notes.layer.cornerRadius = 47
        notes.layer.borderColor = UIColor.black.cgColor
        notes.layer.shadowColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 0.5).cgColor
        notes.layer.shadowOpacity = 1
        notes.layer.shadowRadius = 15
        notes.layer.shadowOffset = CGSize(width: 10, height: 10)
        notes.titleLabel?.numberOfLines = 0
        notes.sizeToFit()
        notes.addTarget(self, action: #selector(notesVC), for: .touchUpInside)
        view.addSubview(notes)
    }
    func photosButtonStp(){
        photosButton.translatesAutoresizingMaskIntoConstraints = false
        photosButton.setTitle("Photos",for: .normal)
        photosButton.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 30)
        photosButton.layer.backgroundColor = UIColor.clear.cgColor
        photosButton.setTitleColor(.black, for: .normal)
        photosButton.layer.cornerRadius = 47
        photosButton.layer.borderColor = UIColor.black.cgColor
        photosButton.layer.shadowColor = UIColor(red: 225 / 255,
                                                 green: 225 / 255,
                                                 blue: 235 / 255,
                                                 alpha: 0.5).cgColor
        photosButton.layer.shadowOpacity = 1
        photosButton.layer.shadowRadius = 15
        photosButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        photosButton.titleLabel?.numberOfLines = 0
        photosButton.sizeToFit()
        photosButton.addTarget(self, action: #selector(photoVC), for: .touchUpInside)
        view.addSubview(photosButton)
    }
    func constraints(){
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            firstButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            firstButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            firstButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            tapOrHold.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 25),
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
    }
    // Move to enother VC:
    @objc func TipsCalculatorVC(){
        let viewController = TipsCalculator()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) {
            print("Tips Calculator")
        }
    }
    @objc func tapOrHoldVC(){
        let viewController = TapOrHoldVC()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) {
            print("Tap or hold")
        }
    }
    @objc func dateAndTimeVC(){
        let viewController = TimeAndDate()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) {
            print("Time And Date")
        }
    }
    @objc func notesVC(){
        let viewController = NotesViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) {
        print("Notes")
            }
        }
    @objc func photoVC(){
        let viewController = PhotosVC()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) {
        print("Photos")
            }
        }
}
