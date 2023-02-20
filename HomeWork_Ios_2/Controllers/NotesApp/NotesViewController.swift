//
//  NotesViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 04.01.2023.
//

import UIKit

class NotesViewController: UIViewController {
    
    let dismissBarButton = UIBarButtonItem()
    let editBarButton = UIBarButtonItem()
    let addButton = AddNoteButtonNote()
    let editButton = AddEditButton()
    let removeAll = RemoveAllButton()
//    let buttonDismiss = UIButton()
    var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .customBackgroundColor
        view.addSubview(tableView)
        title = "Notes"
        
        
        addChildVC()
        setupTableView()
        dismissBarButtonSettings()
        addButtonSetup()
        editButtonBarSettings()
//        editButtonSetup()
//        removeAllSetup()
        constraine()
        
    }
//MARK: - Navigation controller setup
    func addChildVC(){
//        addChild(topBar)
//        view.addSubview(topBar.view)
        
        let navVC = UINavigationController()
        
        view.addSubview(navVC.view)
        
        navigationItem.leftBarButtonItem = dismissBarButton
//        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = editBarButton
    }
    
    
//MARK: - buttons setup:
    //addButton setup
    func addButtonSetup(){
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(addButtonFunc), for: .touchUpInside)
    }
    //editButton setup:
    func editButtonSetup(){
        view.addSubview(editButton)
        editButton.addTarget(self, action: #selector(editButtonFunc), for: .touchUpInside)
    }
    // dismissBarButtonSettings - настройки для кнопки dismiss в Navigation Controller
    func dismissBarButtonSettings(){

        dismissBarButton.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Copperplate-Bold" ,size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .normal)
        dismissBarButton.title = "Dismiss"
        dismissBarButton.target = self
        dismissBarButton.action = #selector(backFunc)
    }
    // edit Button - настройки для кнопки Edit в Navigation Controller
    func editButtonBarSettings(){
        editBarButton.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Copperplate-Bold" ,size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .normal)
        editBarButton.title = "Edit"
        editBarButton.target = self
        editBarButton.action = #selector(editButtonFunc)
    }
    
    
    
    //MARK: - Constraine
    func constraine(){
        
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 45 ),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
        ])
    }
              
        
    @objc func backFunc(){
       let viewcontroller = ViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true) {
//        dismiss(animated: true)
            print("Back to main")
        }
    }
    //MARK: - Add button переход для записей
    @objc func addButtonFunc(){
        let viewcontroller = EditNoteViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true)
            print("Add note nenu")
        }
    //MARK: - Edit button переход для редактирования
    @objc func editButtonFunc(){
        if tableView.isEditing{
            
            tableView.setEditing(false, animated: true)
            editBarButton.title = "Edit"
            editBarButton.isEnabled = true
            
        } else {
            tableView.setEditing(true, animated: true)
            editBarButton.title = "Done"
            addButton.isHidden = false
            editBarButton.isEnabled = true
            editBarButton.target = self
//            editBarButton.action = #selector(removeAllselector)
        }
        
    }
  //MARK: - Selector remove all
    @objc func removeAllselector(){
        
        print("All removed")
//        tableView.setEditing(false, animated: true)
        
        }
}

