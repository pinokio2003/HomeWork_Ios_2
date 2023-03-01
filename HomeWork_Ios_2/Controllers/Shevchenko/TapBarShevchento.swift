//
//  TapBarShevchento
//  HomeWork_Ios_2
//
//  Created by Anatolii Kravchuk on 23.02.2023.
//

import Foundation
import UIKit

class TapBarShevchento: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        setupViewControllers()
    }
    func setupViewControllers(){
        let firstShevchenko = ShevchenkoViewController()
        let secondShevchenko = ShevchenkoSecondViewController()
        
        firstShevchenko.title = "Verse Shevchenko"
        secondShevchenko.title = "Second"
        
        firstShevchenko.navigationItem.largeTitleDisplayMode = .never
        secondShevchenko.navigationItem.largeTitleDisplayMode = .never
        
        let navFirst = UINavigationController(rootViewController: firstShevchenko)
        let navSecond = UINavigationController(rootViewController: secondShevchenko)
        
        navFirst.tabBarItem = UITabBarItem(title: "Verse Shevchenko",
                                           image: UIImage(systemName: "pencil.circle"),
                                           tag: 1)
        
        navSecond.tabBarItem = UITabBarItem(title: "Second",
                                            image: UIImage(systemName: "pencil.and.outline"),
                                           tag: 2)
        
        for nav in [navFirst, navSecond] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
    setViewControllers(
                        [navFirst, navSecond],
                        animated: true)
    }
}
