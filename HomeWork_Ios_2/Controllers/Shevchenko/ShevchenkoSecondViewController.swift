//
//  ShevchenkoSecondViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 23.02.2023.
//

import UIKit

class ShevchenkoSecondViewController: UIViewController {
    
    var strings = orlovVerse
    var labels: [UILabel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func showText() {
        // Получаем следующую строку текста
        guard let text = strings.first else {
            return
        }
        // Создаем UILabel и добавляем его на view
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        // Добавляем ограничения на расположение нового UILabel
        if let previousLabel = labels.last {
            label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: 10).isActive = true
        } else {
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        }
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        // Устанавливаем текст и размер шрифта
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18)
        // Добавляем UILabel в массив для последующих использований
        labels.append(label)
        // Удаляем первую строку из массива
        strings.removeFirst()
        // Добавляем анимацию появления
        label.alpha = 0
        UIView.animate(withDuration: 0.9) {
            label.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
}
