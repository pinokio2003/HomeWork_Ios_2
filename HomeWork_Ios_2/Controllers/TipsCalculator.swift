//
//  TipsCalculator.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 30.12.2022.
//

import UIKit

class TipsCalculator: UIViewController, UITextFieldDelegate {
    
    let textField = UITextField()
    let lableTip = UILabel()
    let lableCash = UILabel()
    let lableTotal = UILabel()
    let lableTotalCash = UILabel()
    let toolBar = UIToolbar()
    let slider = UISlider()
    let buttonDismiss = UIBarButtonItem()
    
    var amt: Int = 0
    var price: Double = 0
    var num:Int = 25
    var testTips: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tips"
        view.backgroundColor = .customBackgroundColor
        runAllFunc()
    }
    
    func runAllFunc(){
        DoneButtonStp()
        addChildVC()
        textFieldSetup()
        lableTipSetup()
        lableCashSetup()
        lableTotalSetup()
        lableTotalCashSetup()
        sliderSetup()
        buttonDismissSettings()
        constraine()
    }
    //MARK: - Navigation controller setup
    func addChildVC(){
        let navVC = UINavigationController()
        view.addSubview(navVC.view)
        navigationItem.leftBarButtonItem = buttonDismiss
    }
    
    //MARK: - Text Field setup
    func textFieldSetup(){
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "$0.00"
        textField.borderStyle = .roundedRect
        textField.inputAccessoryView = toolBar
        textField.keyboardType = .decimalPad
        textField.textAlignment = .right
        textField.delegate = self
        textField.keyboardAppearance = .default
        textField.clearButtonMode = .always
        textField.font = UIFont(name: "Copperplate-Bold" ,size: 40)
        
        view.addSubview(textField)
    }
    
    
    //MARK: - Lable's setup
    func lableTipSetup(){
        lableTip.translatesAutoresizingMaskIntoConstraints = false
        lableTip.text = "Tip (0%)"
        view.addSubview(lableTip)
    }
    func lableCashSetup(){
        lableCash.translatesAutoresizingMaskIntoConstraints = false
        lableCash.text = "$ 0.00"
        view.addSubview(lableCash)
    }
    func lableTotalSetup(){
        lableTotal.translatesAutoresizingMaskIntoConstraints = false
        lableTotal.text = "Total"
        view.addSubview(lableTotal)
    }
    func lableTotalCashSetup(){
        lableTotalCash.translatesAutoresizingMaskIntoConstraints = false
        lableTotalCash.text = "$ 0.00"
        view.addSubview(lableTotalCash)
    }
    func buttonDismissSettings() {
        buttonDismiss.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Copperplate-Bold" ,size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .normal)
        
        buttonDismiss.title = "Dismiss"
        buttonDismiss.target = self
        buttonDismiss.action = #selector(backFunc)
    }
    //MARK: - "Done" button setup:
    func DoneButtonStp() {
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem:.flexibleSpace,
                                            target: self,
                                            action: nil)
        
        let buttonDone = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(buttonDoneSelector))
        toolBar.setItems([flexibleSpace, buttonDone], animated: true)
        
    }
    //MARK: - slider setup
    func sliderSetup(){
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.isEnabled = false
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.value = Float(num)
        slider.addTarget(self, action: #selector(sliderAction(sender:)), for: .valueChanged)
        view.addSubview(slider)
    }
    
    
    //MARK: - Constraine
    func constraine(){
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 15),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            textField.heightAnchor.constraint(equalToConstant: 55)
        ])
        NSLayoutConstraint.activate([
            lableTip.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            lableTip.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -120),
            lableTip.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            lableCash.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            lableCash.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            lableCash.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            lableTotal.topAnchor.constraint(equalTo: lableTip.bottomAnchor, constant: 5),
            lableTotal.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -120),
            lableTotal.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            lableTotalCash.topAnchor.constraint(equalTo: lableTip.bottomAnchor, constant: 5),
            lableTotalCash.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            lableTotalCash.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: lableTotalCash.bottomAnchor, constant: 10),
            slider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            slider.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -15)
        ])
    }
    @objc func buttonDoneSelector(_ sender: UIBarButtonItem){
        textField.resignFirstResponder()
        slider.isEnabled = true
        
        if textField.text?.first == "$" {
            textField.text!.remove(at: textField.text!.startIndex)
        } else if textField.text?.first == nil {
            textField.text = "(0)"
        }
        price = Double(textField.text!) ?? Double(0.0)
        textField.text = String(format: "$%.2f", price)
        //   String(format: "$%.2f", totalPrice)
        var tipPrice: Double = price * Double(num) / 100
        
        //округление: 1 0.5 2
        tipPrice = round(tipPrice * 20.00) / 20.00
        
        let totalPrice: Double = price + tipPrice
        // отправляем в лейблы
        lableTip.text = "Tip (\(num)%)"
        
        //попробовал через формат String(format: "%.2f", ...)
        lableCash.text = String(format: "$%.2f", tipPrice)
        lableTotalCash.text = String(format: "$%.2f", totalPrice) //попробовал через формат String(format: "%.2f", ...)
    }
    
    @objc func sliderAction(sender: UISlider) {
        num = Int(sender.value)
        
        var tipPrice: Double = price * Double(num) / 100
        
        //округление: 1 0.5 2
        tipPrice = round(tipPrice * 20.00) / 20.00
        
        let totalPrice: Double = price + tipPrice
        // отправляем в лейблы
        lableTip.text = "Tip (\(num)%)"
        
        //попробовал через формат String(format: "%.2f", ...)
        lableCash.text = String(format: "$%.2f", tipPrice)
        lableTotalCash.text = String(format: "$%.2f", totalPrice) //попробовал через формат String(format: "%.2f", ...)
    }
    
    
    //MARK: - calculate tips пока оставлю
    func textFieldDidEndEditing(_ textField: UITextField) {
        price = Double(textField.text!) ?? 0
        
        let tipPrice:Double = price * Double(num) / 100
        let totalPrice: Double = price + tipPrice
        
        lableTip.text = "Tip (\(num)%)"
        lableCash.text = "$ \(tipPrice)"
        lableTotalCash.text = "$ \(totalPrice)"
        
        
    }
    //Dismiss button
    @objc func backFunc(){
        dismiss(animated: true)
            print("Back to main")
        }
    }


