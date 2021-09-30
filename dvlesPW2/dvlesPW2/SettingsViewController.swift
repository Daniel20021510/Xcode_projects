//
//  SettingsViewController.swift
//  dvlesPW2
//
//  Created by Даниил Лесь on 28.09.2021.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupCloseButton()
    }
    
    private func setupCloseButton() {
        let button = UIButton(type: .close)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -10
        ).isActive = true
        button.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 10
        ).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(
            equalTo: button.heightAnchor
        ).isActive = true
        button.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
     }
     @objc
     private func closeScreen() {
        dismiss(animated: true, completion: nil)
     }
}
