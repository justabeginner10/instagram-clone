//
//  SplashScreenViewController.swift
//  Instagram-Clone
//
//  Created by Aditya on 01/11/24.
//

import UIKit
import SnapKit

/// SplashScreenViewController
///
/// A view controller that displays a splash screen with Instagram-style icon and footer
/// for a set duration before transitioning to the main landing view controller.
///
/// This view controller serves as a splash screen that mimics the launch screen,
/// allowing for a seamless transition between the app's launch and main interface.
/// It displays an icon in the center and a footer image aligned to the bottom,
/// using a delay to control the splash duration before navigating to the `IgHomeViewController`.
///
/// - Uses:
///   - `SnapKit` for layout constraints.
///   - `UIImageView` for displaying icon and footer images.
///   - `DispatchQueue` for a timed transition after 3 seconds.
class SplashScreenViewController: UIViewController {

    // MARK: - Properties
    
    /// ImageView for displaying the Instagram-style icon at the center of the splash screen.
    private let igIconView: UIImageView = {
        let image = UIImageView(frame: igIconImageSize)
        image.image = UIImage(named: igIconImageName)
        return image
    }()
    
    /// ImageView for displaying the footer logo near the bottom of the splash screen.
    private let igFooterView: UIImageView = {
        let image = UIImageView(frame: footerImageSize)
        image.image = UIImage(named: footerImage)
        return image
    }()
    
    // MARK: - Lifecycle Methods
    
    /// Called after the controller's view is loaded into memory.
    /// Sets up the splash screen's background color and adds the necessary UI elements.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground
        self.setupUI()
    }
    
    /// Called when the view appears on the screen.
    /// Adds a delay before navigating to the main view controller.
    /// - Parameter animated: Whether the appearance is animated.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Add delay before navigating to the main landing view controller
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.showMainViewController()
        }
    }
    
    // MARK: - Setup UI
    
    /// Sets up the UI by adding `igIconView` and `igFooterView` to the view hierarchy
    /// and configuring their layout constraints using SnapKit.
    private func setupUI() {
        self.view.addSubview(igIconView)
        self.view.addSubview(igFooterView)
        
        igIconView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        igFooterView.snp.makeConstraints { make in
            make.centerX.equalTo(igIconView)
            make.bottom.equalToSuperview().offset(footerOffset)
        }
    }
    
    // MARK: - Navigation
    
    /// Navigates to the main view controller (`IgHomeViewController`) after the splash screen delay.
    /// Configures a cross-dissolve transition for a smooth effect.
    private func showMainViewController() {
        let destination = IgHomeViewController()
        destination.modalTransitionStyle = .crossDissolve
        destination.modalPresentationStyle = .fullScreen
        navigationController?.present(destination, animated: true)
    }
}

// MARK: - Constants

/// Name of the Instagram-style icon image displayed at the center of the splash screen.
private let igIconImageName: String = "IgIcon"

/// Frame size for the Instagram-style icon.
private let igIconImageSize: CGRect = CGRect(x: 0, y: 0, width: 90, height: 90)

/// Name of the footer image displayed near the bottom of the splash screen.
private let footerImage: String = "IgMetaIcon"

/// Frame size for the footer image.
private let footerImageSize: CGRect = CGRect(x: 0, y: 0, width: 77, height: 39)

/// Offset value for positioning the footer image above the bottom of the screen.
private let footerOffset: CGFloat = -50
