//
//  Container.swift
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 09.02.2023.
//

import UIKit

class Container: UIViewController {

    let topBar = TopBarController()
    let editVC = NotesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        addChildVC()
        
 
    }
    
    func addChildVC(){
//        addChild(topBar)
//        view.addSubview(topBar.view)
        
        let navVC = UINavigationController(rootViewController: editVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
    }

    
//    navigationItem.leftBarButtonItem = UIBarButtonItem(
//                                                            barButtonSystemItem:.edit,
//                                                            target: self,
//                                                            action: #selector(editFunc))


}
