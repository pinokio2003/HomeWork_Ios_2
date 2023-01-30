//
//  PhotosVC.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 05.01.2023.
//

import UIKit

class PhotosVC: UIViewController {

    let buttonDismiss = UIButton()
    
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: UICollectionViewFlowLayout()
                                        )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        
        colllectionViewSetup()
        buttonDismissSettings()
        constraine()
    }
    
//MARK: - collectionView Setup
    func colllectionViewSetup(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(Images.self,
                                forCellWithReuseIdentifier: Images.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
     //   collectionView.frame = view.bounds
        collectionView.frame = CGRect(x: 0,
                                      y: 65,
                                      width: view.bounds.size.width,
                                      height: (view.bounds.size.height) - 80)
        collectionView.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
    }
    
    
//MARK: - Dismiss button
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
            buttonDismiss.heightAnchor.constraint(equalToConstant: 10)
        ])

    }
              
        
    @objc func backFunc(){
       let viewcontroller = ViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true) {
            print("Back to main")
        }
    }
    
}
