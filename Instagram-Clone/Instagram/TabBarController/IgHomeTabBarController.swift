//
//  HomeTabBarController.swift
//  Instagram-Clone
//
//  Created by Aditya on 01/11/24.
//

import UIKit

/// A custom tab bar controller for managing the main tab-based navigation within the Instagram-like app.
///
/// `IgHomeTabBarController` subclasses `UITabBarController` and initializes five main tabs for the home,
/// search, create, reels, and profile sections. Each tab is assigned a custom icon, including selected and
/// unselected states where applicable. The tab bar appearance is also customized for consistency with the app's
/// design.
///
/// - Important:
///   Ensure that all icons (homeUnSelectedIcon, homeSelectedIcon, etc.) are available in the asset catalog.
///
/// - Author: Your Name
final class IgHomeTabBarController: UITabBarController {

    // MARK: - Lifecycle
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabBar()
        self.customizeTabBarAppearance()
    }
    
    // MARK: - Private Methods
    
    /// Configures the view controllers for each tab and assigns the corresponding icons.
    ///
    /// - Creates and assigns five main view controllers: `IgHomeViewController`, `IgSearchViewController`,
    ///   `IgCreateViewController`, `IgReelsViewController`, and `IgProfileViewController`.
    /// - Each view controller is assigned a `UITabBarItem` with an icon for the unselected and selected states.
    private func setupTabBar() {
        // Initialize each view controller
        let homeVC = IgHomeViewController()
        let searchVC = IgSearchViewController()
        let createVC = IgCreateViewController()
        let reelsVC = IgReelsViewController()
        let profileVC = IgProfileViewController()
        
        // Assign custom tab bar items
        homeVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "homeUnSelectedIcon"),
            selectedImage: UIImage(named: "homeSelectedIcon")
        )
        
        searchVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "searchUnSelectedIcon"),
            selectedImage: UIImage(named: "searchSelectedIcon")
        )
        
        createVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "createUnSelectedIcon"),
            selectedImage: UIImage(named: "createSelectedIcon")
        )
        
        reelsVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "reelsUnSelectedIcon"),
            selectedImage: UIImage(named: "reelsSelectedIcon")
        )
        
        profileVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person.circle"),
            selectedImage: UIImage(systemName: "person.circle.fill")
        )
        
        // Set the view controllers for the tab bar
        self.viewControllers = [
            homeVC,
            searchVC,
            createVC,
            reelsVC,
            profileVC
        ]
    }
    
    /// Customizes the appearance of the tab bar to match the app's design.
    ///
    /// - Sets the background color to white and ensures the tab bar is non-translucent.
    /// - Configures the `tintColor` for selected items and the `unselectedItemTintColor` for unselected items.
    private func customizeTabBarAppearance() {
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
    }
}
