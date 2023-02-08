//
//  NotesData.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 26.01.2023.
//

import Foundation
//сделаю тюплом но думаю можно и структурой
    
let com = EditNoteViewController().countryMy

var modelNotes: [(titleNote: String, time: String, date: String, countryL: String, city: String)] = [(
                                        titleNote: "This is my note \nThis note consists of two lines",
                                        timeSetup(),
                                        dateSetup(),
                                        countryL: "country",
                                        city: "city"
                                        )]

