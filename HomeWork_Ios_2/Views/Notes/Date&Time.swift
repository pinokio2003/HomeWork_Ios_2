//
//  Date&Time.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.01.2023.
//

import Foundation

func timeSetup() -> String{
    let timeFormate = DateFormatter()
    timeFormate.dateFormat = "HH:mm"
    
    return timeFormate.string(from: Date())
}

func dateSetup() -> String{
    let dateFormate = DateFormatter()
    dateFormate.dateFormat = "dd.MM.YY"
    
    return dateFormate.string(from: Date())
}
