//
//  EditNoteViewController.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 27.01.2023.
//

import UIKit
import CoreLocation

class EditNoteViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {

    let backButton = BackButton()
    let findButton = FindButton()
    let textField = UITextField()
    let lableLocation = LableLocation()
    let toolBar = UIToolbar()
    
    var textFromTextField: String = ""
    var countryMy: String = ""
    var cityMy: String = ""
    //LocationManager :
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation!
    var geocoder: CLGeocoder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        
        backButtonSettings()
        fundButtonSetting()
        textFieldSetup()
        lableLocationSetting()
        geocoder = CLGeocoder() //Геокодер
        locationManagerSetup() // Менеджер локации
                        
        changeLocationBttnTapped() // find location func
        constraines()

    }
    func backButtonSettings(){
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backToNotesFunc), for: .touchUpInside)
    }
    func fundButtonSetting(){
        view.addSubview(findButton)
        findButton.addTarget(self, action: #selector(reverseGeocodeLocationBttnTapped), for: .touchUpInside)
    }
    func lableLocationSetting(){
        view.addSubview(lableLocation)
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
                textField.heightAnchor.constraint(equalToConstant: 60),
            
            findButton.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 30),
            findButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            findButton.heightAnchor.constraint(equalToConstant: 50),
            
            lableLocation.topAnchor.constraint(equalTo: findButton.bottomAnchor,constant: 30),
            lableLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lableLocation.heightAnchor.constraint(equalToConstant: 50),
            ])
            }
    //MARK: - Location manager setup:
    func locationManagerSetup(){
            locationManager = CLLocationManager()
            locationManager.delegate = self
        }
    //Geocoder - получаем координаты локации при подтверждении пользователя :
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Create a switch statement for the CLLocationManager.authorizationStatus() value
        switch CLLocationManager.authorizationStatus() {
            // Compare the switch value to the authorizedWhenInUse case
        case .authorizedWhenInUse:
            // Start reporting the user's location
            locationManager.startUpdatingLocation()
            guard let currentLocation = locationManager.location else { return }
            self.currentLocation = currentLocation
            print("LOCATION: \(currentLocation)")
        default:
            return
        }
    }
        //функция для получения координатов (можно сделать селектором)
        func changeLocationBttnTapped() {
            if CLLocationManager.locationServicesEnabled() {
                // Request when in use authorization status.
                locationManager.requestWhenInUseAuthorization()
            }
        }
        // функция реверса(перевод из координат в имя
    @objc func reverseGeocodeLocationBttnTapped(_ sender: Any?) {
            
            guard let currentLocation = self.currentLocation else {
                print("Unable to reverse-geocode location.")
                return
            }
            
            geocoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) in
                if let error = error {
                    print(error)
                }

                guard let placemark = placemarks?.first else { return }
//                guard let streetNumber = placemark.subThoroughfare else { return }
//                guard let streetName = placemark.thoroughfare else { return }
                guard let city = placemark.locality else { return }
//                guard let state = placemark.administrativeArea else { return }
//                guard let zipCode = placemark.postalCode else { return }
                guard let country = placemark.country else {return}
                
                DispatchQueue.main.async {
                    self.lableLocation.text = " \(city) \n \(country)"
                    self.countryMy = "\(country)"
                    self.cityMy = "\(city)"
                    print("\(city), \(country)")
                }
            }
        }
    
        

                                    
    //MARK: - функция "назад" для кнопки
    @objc func backToNotesFunc(_ textField: UITextField){
        let viewcontroller = UINavigationController(rootViewController: NotesViewController())
        let time = timeSetup()
        let date = dateSetup()
        
        viewcontroller.modalPresentationStyle = .fullScreen
        
        if textFromTextField.isEmpty { print("No data fore save in note") }
        else{
            modelNotes.append((titleNote: textFromTextField,
                               time: time,
                               date: date,
                               countryL: countryMy,
                               city: cityMy))
        }
        
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
