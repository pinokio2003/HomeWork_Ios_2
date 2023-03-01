//
//  ShevchenkoViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 22.02.2023.
//

import UIKit

class ShevchenkoViewController: UIViewController {

    let backgroundView = FirstViewShevchenko()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        title = "Verse "
        backGroundSetup()

//        addLabels()
    }
    

    func backGroundSetup(){
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
