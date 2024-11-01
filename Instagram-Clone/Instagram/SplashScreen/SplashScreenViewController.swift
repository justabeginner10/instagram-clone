//
//  SplashScreenViewController.swift
//  Instagram-Clone
//
//  Created by Aditya on 01/11/24.
//

import UIKit
import SnapKit

class SplashScreenViewController: UIViewController {
    private let igIconView: UIImageView = {
        let image = UIImageView(frame: igIconImageSize)
        image.image = UIImage(named: igIconImageName)
        return image
    }()
    
    private let igFooterView: UIImageView = {
        let image = UIImageView(frame: footerImageSize)
        image.image = UIImage(named: footerImage)
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup UI
        self.view.backgroundColor = UIColor.systemBackground
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Add delay before transitioning
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.showMainViewController()
        }
    }
    
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
    
    private func showMainViewController() {
        let destination = IgHomeViewController()
        destination.modalTransitionStyle = .crossDissolve
        destination.modalPresentationStyle = .fullScreen
        navigationController?.present(destination, animated: true)
    }
}

private let igIconImageName: String = "IgIcon"
private let igIconImageSize: CGRect = CGRect(x: 0, y: 0, width: 90, height: 90)
private let footerImage: String = "IgMetaIcon"
private let footerImageSize: CGRect = CGRect(x: 0, y: 0, width: 77, height: 39)
private let footerOffset: CGFloat = -50
