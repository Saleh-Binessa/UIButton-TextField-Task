//
//  ViewController.swift
//  UIButton-TextField-Task
//
//  Created by Saleh Bin Essa on 19/03/2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let userImageView = UIImageView()
    private let imageNameTextField = UITextField()
    private let loadImageButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupUserImageView()
        setupImageTextField()
        setupImageButton()
        setupLayouts()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupUserImageView() {
        userImageView.contentMode = .scaleAspectFit
        userImageView.layer.borderWidth = 1
        userImageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        userImageView.layer.cornerRadius = 20
        userImageView.clipsToBounds = true
        view.addSubview(userImageView)
    }
    
    private func setupImageTextField() {
        imageNameTextField.placeholder = "Enter image name here"
        imageNameTextField.borderStyle = .roundedRect
        imageNameTextField.textAlignment = .center
        view.addSubview(imageNameTextField)
    }
    
    private func setupImageButton() {
        loadImageButton.setTitle("Load Image", for: .normal)
        loadImageButton.backgroundColor = .systemBlue
        loadImageButton.setTitleColor(.white, for: .normal)
        loadImageButton.layer.cornerRadius = 10
        loadImageButton.addTarget(self, action: #selector(loadImageButtonTapped), for: .touchUpInside)
        view.addSubview(loadImageButton)
    }
    
    private func setupLayouts() {
        userImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(userImageView.snp.width)
        }
        
        imageNameTextField.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(44)
        }
        
        loadImageButton.snp.makeConstraints { make in
            make.top.equalTo(imageNameTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(90)
            make.trailing.equalToSuperview().offset(-90)
            make.height.equalTo(50)
        }
    }
    
    @objc private func loadImageButtonTapped() {
        let imageName = imageNameTextField.text ?? ""
        // added some animation ;)
        UIView.transition(with: userImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.userImageView.image = UIImage(named: imageName)
        })
    }
}
