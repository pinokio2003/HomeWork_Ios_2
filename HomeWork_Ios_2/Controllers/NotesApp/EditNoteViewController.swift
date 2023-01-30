//
//  EditNoteViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.01.2023.
//

import UIKit

class EditNoteViewController: UIViewController, UITextFieldDelegate {

    let backButton = BackButton()
    let textField = UITextField()
    let toolBar = UIToolbar()
    
    var textFromTextField: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        
        backButtonSettings()
        textFieldSetup()
        
        constraines()

    }
    func backButtonSettings(){
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backToNotesFunc), for: .touchUpInside)
    }
    //MARK: - text field settings
        func textFieldSetup(){
            DoneButtonStp()
            view.addSubview(textField)
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "print notes "
            textField.borderStyle = .roundedRect
            textField.inputAccessoryView = toolBar
            textField.keyboardType = .default
            textField.textAlignment = .left
            textField.delegate = self
            textField.keyboardAppearance = .default
            textField.clearButtonMode = .always
            textField.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        }
    
    //MARK: - "Done" button setup:
    func DoneButtonStp() {
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem:.flexibleSpace,
                                            target: self,
                                            action: nil)
        
        let buttonDone = UIBarButtonItem(title: "OK",
                                         style: .done,
                                         target: self,
                                         action: #selector(buttonDoneSelector))
        toolBar.setItems([flexibleSpace, buttonDone], animated: true)
    }
    
  //MARK: - constraine
    
    func constraines(){
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 10),
            
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 5),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -5),
            textField.heightAnchor.constraint(equalToConstant: 60)
            ])
            }
                                    
    //MARK: - функция назад для кнопки
    @objc func backToNotesFunc(_ textField: UITextField){
        let viewcontroller = NotesViewController()
        let time = timeSetup()
        let date = dateSetup()
        
        viewcontroller.modalPresentationStyle = .fullScreen
        
        modelNotes.append((titleNote: textFromTextField, time: time, date: date))
        present(viewcontroller, animated: true) {
            print("Back to main Тotes")
            
        }
    }
    
    //MARK: - сохранить дату в моделе:

    // функция сохоаняет каждый символ который появляеться на textField, мы просто сохраняем каждый раз в стрингу
    // которую потом передаетм в функцию backToNotesFunc где аппендим в нашу базу
    func textFieldDidChangeSelection(_ textField: UITextField) {
         textFromTextField = textField.text ?? ""
    }
    
    //MARK: - Done button func
    @objc func buttonDoneSelector(_ sender: UIBarButtonItem){
        textField.resignFirstResponder()
    }
    
}
