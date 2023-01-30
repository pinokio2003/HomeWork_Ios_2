//
//  CellTableView+Note.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.01.2023.
//

import UIKit

class CellTableViewNote: UITableViewCell {

    static let identifire = "NoteCell"
    let noteLable = UILabel()
    let timeLabe = UILabel()
    let dateLable = UILabel()
    let countryLable = UILabel()
    let cityLable = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - Init:
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        
        noteLableSetup()
        timeLableSetup()
        dateLableSetup()
        countryLableSetup()
        cityLableSetup()
        constraineCell()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - noteLableSetup
    func noteLableSetup(){
        contentView.addSubview(noteLable)
        noteLable.textColor = .black
        noteLable.text = "some text"
        noteLable.sizeToFit()
        noteLable.translatesAutoresizingMaskIntoConstraints = false
    //MARK: - Text func
        func takeText(_ text: String){
            noteLable.text = text
        }
    }
    //MARK: - timeLable
    func timeLableSetup(){
        contentView.addSubview(timeLabe)
        timeLabe.font = UIFont(name: "Copperplate-Bold" ,size: 15)
        timeLabe.textColor = .black
//        timeLabe.text = timeSetup()
        timeLabe.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK: - dateLable
    func dateLableSetup(){
        contentView.addSubview(dateLable)
        dateLable.font = UIFont(name: "Copperplate-Bold" ,size: 15)
        dateLable.textColor = .black
//        dateLable.text = dateSetup()
        dateLable.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK: - countryLable
    func countryLableSetup(){
        contentView.addSubview(countryLable)
        countryLable.font = UIFont(name: "Copperplate-Bold" ,size: 15)
        countryLable.textColor = .black
        countryLable.text = "country"
        countryLable.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK: - CityLable
    func cityLableSetup(){
        contentView.addSubview(cityLable)
        cityLable.font = UIFont(name: "Copperplate-Bold" ,size: 15)
        cityLable.textColor = .black
        cityLable.text = "city"
        cityLable.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK: - constraine
    func constraineCell(){
        NSLayoutConstraint.activate([
            noteLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            noteLable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            noteLable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -70),
            noteLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            dateLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLable.leftAnchor.constraint(equalTo: noteLable.rightAnchor, constant: 1),
            dateLable.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            dateLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
            
            timeLabe.topAnchor.constraint(equalTo: dateLable.bottomAnchor,constant: 0),
            timeLabe.leftAnchor.constraint(equalTo: noteLable.rightAnchor, constant: 1),
            timeLabe.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            timeLabe.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            
            countryLable.topAnchor.constraint(equalTo: timeLabe.bottomAnchor,constant: 0),
            countryLable.leftAnchor.constraint(equalTo: noteLable.rightAnchor, constant: 1),
            countryLable.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            countryLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            cityLable.topAnchor.constraint(equalTo: countryLable.bottomAnchor,constant: 0),
            cityLable.leftAnchor.constraint(equalTo: noteLable.rightAnchor, constant: 1),
            cityLable.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cityLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

}
