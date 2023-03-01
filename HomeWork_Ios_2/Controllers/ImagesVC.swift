//
//  PhotosVC.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 05.01.2023.
//

import UIKit

class PhotosVC: UIViewController {
    
    let imagesPlanet = planetImages
    let buttonDismiss = UIBarButtonItem()
    
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: UICollectionViewFlowLayout()
                                        )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        title = "Photos"
        addChildVC()
        colllectionViewSetup()
        
        buttonDismissSettings()

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
                                      y: 85,
                                      width: view.bounds.size.width,
                                      height: (view.bounds.size.height) - 90)
        collectionView.backgroundColor = .customBackgroundColor
    }
    
//MARK: - Dismiss button
    func buttonDismissSettings(){
        buttonDismiss.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Copperplate-Bold" ,size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .normal)
        buttonDismiss.title = "Dismiss"
        buttonDismiss.target = self
        buttonDismiss.action = #selector(backFunc)
    }
    
    func addChildVC(){
        let navVC = UINavigationController()
        view.addSubview(navVC.view)
        navigationItem.leftBarButtonItem = buttonDismiss
        buttonDismissSettings()
    }
    //MARK: - Constraine
//    func constraine(){
//        NSLayoutConstraint.activate([
//            buttonDismiss.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            buttonDismiss.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
//            buttonDismiss.heightAnchor.constraint(equalToConstant: 10)
//        ])
//
//    }
    
    @objc func backFunc(){
        dismiss(animated: true)
            print("Back to main")
        }
    
}
