//
//  NavigationController.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 24/06/2023.
//

import UIKit

class NavigationViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        topBorderColor()
    }
    
}
extension NavigationViewController {
    fileprivate func generateNavigationViewController(vc: UIViewController, image: UIImage) -> UINavigationController {

        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
}

// MARK: - setupNavigationController
extension NavigationViewController {
    private func setupNavigationController() {
//        UITabBar.appearance().barTintColor = UIColor.backgroundColor
        UITabBar.appearance().tintColor = UIColor(red: 253.0/255.0, green: 59.0/255.0, blue: 104.0/255.0, alpha: 1.0)

		
		let vc = ViewController()
		let requester = Requester()
		let requestBuilder = RequestBuilder()
		vc.networkService = NetworkService(requester: requester, requestBuilder: requestBuilder)
		
        let homeVC = generateNavigationViewController(vc: vc, image: UIImage(named: "menu")!)
        homeVC.title = "Menu"
        let contactsVC = generateNavigationViewController(vc: UIViewController(),  image: UIImage(named: "contacts")!)
        contactsVC.title = "Contacts"
        let profileVC = generateNavigationViewController(vc: UIViewController(), image: UIImage(named: "profile")!)
        profileVC.title = "Profile"
        let basketVC = generateNavigationViewController(vc: UIViewController(), image: UIImage(named: "basket")!)
        basketVC.title = "Basket"

        UINavigationBar.appearance().prefersLargeTitles = true
        viewControllers = [homeVC, contactsVC, profileVC, basketVC]
    }
    
    func topBorderColor() {
        let topBorderColor = UIColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1.0)

        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.clear

        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1)
        topBorder.backgroundColor = topBorderColor.cgColor

        tabBar.layer.addSublayer(topBorder)
    }
}

