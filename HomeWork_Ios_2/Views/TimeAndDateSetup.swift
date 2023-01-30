//
//  TimeAndDate.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 28.12.2022.
//

import UIKit

extension TimeAndDate{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: - Clock
        timer = Timer.scheduledTimer(timeInterval: 5,
                                     target: self,
                                     selector: #selector(second),
                                     userInfo: nil,
                                     repeats: true)
    }
    //Функция переписки лейбла с датами каждый timeInterval
    @objc func second(){
        lableTime.text = timeSetup()
        lableDate.text = dateSetup()
    }
    
    //Format date - для того чтою lable.text мог принять String
    func dateSetup() -> String {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "dd.MM.yyyy"
        return dateFormate.string(from: Date())
    }
    //Format for time
    func timeSetup() -> String{
        let timeFormate = DateFormatter()
        timeFormate.dateFormat = "hh:mm:ss"
        
        return timeFormate.string(from: Date())
    }
    
    @objc func backFunc(){
       let viewcontroller = ViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true) {
            print("Back to main")
        }
    }
}
