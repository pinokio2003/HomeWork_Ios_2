//
//  ScrollView+Note.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.01.2023.
//

import UIKit

extension NotesViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func setupTableView() {
        let tableView = UITableView(frame: .zero)
        tableView.register(CellTableViewNote.self, forCellReuseIdentifier: CellTableViewNote.identifire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor =  UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        view.addSubview(tableView)
        tableView.allowsMultipleSelection = false //Делает возможность выберать пару ячеек для редактирования
        tableView.allowsMultipleSelectionDuringEditing = true //Делает возможность выберать пару ячеек для редактирования
        tableView.separatorColor = .green
        self.tableView = tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelNotes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellTableViewNote.identifire,
                                                 for: indexPath) as! CellTableViewNote
        cell.noteLable.text = modelNotes[indexPath.row].titleNote
        cell.dateLable.text = modelNotes[indexPath.row].date
        cell.timeLabe.text = modelNotes[indexPath.row].time
        cell.countryLable.text = modelNotes[indexPath.row].countryL
        cell.cityLable.text = modelNotes[indexPath.row].city
        return cell
    }
    //MARK: - delete cell with swipe:
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .left)
        modelNotes.remove(at: indexPath.row)
        tableView.endUpdates()
        
//        if editingStyle == .delete{
//
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .left)
//            modelNotes.remove(at: indexPath.row)
//            tableView.endUpdates()
//
//
//        }
    }

}
