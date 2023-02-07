//
//  NotesViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 04.01.2023.
//

import UIKit

class NotesViewController: UIViewController {
    
    let addButton = AddNoteButtonNote()
    let editButton = AddEditButton()
    let removeAll = RemoveAllButton()
    let buttonDismiss = UIButton()
    var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        view.addSubview(tableView)
        

        
        setupTableView()
        addButtonSetup()
        editButtonSetup()
//        removeAllSetup()
        buttonDismissSettings()
        constraine()
        
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
    //removeAll setup:
//        func removeAllSetup(){
//            view.addSubview(removeAll)
//            removeAll.addTarget(self, action: #selector(removeAllselector), for: .touchUpInside)
//
//        }
    //Dismiss button
    
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
            
            addButton.widthAnchor.constraint(equalToConstant: 45 ),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            editButton.widthAnchor.constraint(equalToConstant: 35 ),
            editButton.heightAnchor.constraint(equalToConstant: 35),
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 2),
            editButton.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -15),
            
//            removeAll.widthAnchor.constraint(equalToConstant: 35 ),
//            removeAll.heightAnchor.constraint(equalToConstant: 35),
//            removeAll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 2),
//            removeAll.rightAnchor.constraint(equalTo: editButton.leftAnchor, constant: -15),
        ])
    }
              
        
    @objc func backFunc(){
       let viewcontroller = ViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true) {
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
    @objc func editButtonFunc(_ sender: AddEditButton){
        if tableView.isEditing{
            tableView.setEditing(false, animated: true)
            sender.setImage(UIImage(systemName: "staroflife"), for: .normal)
            editButton.isEnabled = true
            addButton.isHidden = false
            removeAll.isHidden = true
            //button remove constraine
            
        } else {
            tableView.setEditing(true, animated: true)
            sender.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)

            addButton.isHidden = false
            editButton.isEnabled = true
            removeAll.isHidden = false
        }
        
    }
  //MARK: - Selector remove all
    @objc func removeAllselector(){
        tableView.beginUpdates()
        modelNotes.removeAll()
        tableView.endUpdates()
        print("All removed")
        }
}

