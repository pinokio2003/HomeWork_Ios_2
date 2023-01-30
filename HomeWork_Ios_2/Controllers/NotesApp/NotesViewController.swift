//
//  NotesViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 04.01.2023.
//

import UIKit

class NotesViewController: UIViewController {
    
    let editButton = EditButtonNote()
    let buttonDismiss = UIButton()
    var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        view.addSubview(tableView)
        
//        tableView.beginUpdates()
//        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
//        tableView.endUpdates()
        
        setupTableView()
        editButtonSetup()
        buttonDismissSettings()
        constraine()
        
    }
    
//MARK: - editButton setup:
    func editButtonSetup(){
        view.addSubview(editButton)
        editButton.addTarget(self, action: #selector(editButtonFunc), for: .touchUpInside)
    }
    
//MARK: - Dismiss button
    
    func buttonDismissSettings(){
        buttonDismiss.translatesAutoresizingMaskIntoConstraints = false
        buttonDismiss.setTitle("Dismiss", for: .normal)
        buttonDismiss.titleLabel?.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        buttonDismiss.setTitleColor(.black, for: .normal)
        buttonDismiss.sizeToFit()
        buttonDismiss.addTarget(self, action: #selector(backFunc), for: .touchUpInside)
        view.addSubview(buttonDismiss)
    }
    //MARK: - Constraine
    func constraine(){
        
        NSLayoutConstraint.activate([
            buttonDismiss.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonDismiss.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            buttonDismiss.heightAnchor.constraint(equalToConstant: 10),
            
            editButton.widthAnchor.constraint(equalToConstant: 45 ),
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            editButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ])
    }
              
        
    @objc func backFunc(){
       let viewcontroller = ViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true) {
            print("Back to main")
        }
    }
    //MARK: - Edit button переход для записей
    @objc func editButtonFunc(){
        let viewcontroller = EditNoteViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true)
            print("Add note nenu")
        }
    
}
