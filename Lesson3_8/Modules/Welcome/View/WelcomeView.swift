//
//  WelcomeView.swift
//  Lesson3_8
//
//  Created by Evgeny Mastepan on 26.01.2025.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject{
    
}

class WelcomeView: UIViewController, WelcomeViewProtocol{
    
    var presenter: WelcomePresenterProtocol!
    private let ourIndent: CGFloat = 20
    
    private lazy var userImage: UIImageView = {
        $0.image = UIImage(systemName: "person.crop.square.fill")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var quitButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemBlue
        $0.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        $0.setTitle(" Выйти", for: .normal)
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: presenter.action))
    
    private lazy var helloLabel = LabelView()
    private lazy var nameLabel = LabelView()
    private lazy var emailLabel = LabelView(font: .systemFont(ofSize: 14, weight: .regular))
    private lazy var passwordLabel = LabelView(font: .systemFont(ofSize: 14, weight: .regular))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textInit()
        view.addSubviews(userImage, helloLabel, nameLabel, emailLabel, passwordLabel, quitButton)
        setupConstraint()
    }
    
    private func textInit(){
        self.helloLabel.text = "Привет"
        self.nameLabel.text = "Хуй Хуевич"
        self.emailLabel.text = "Ваш email: "
        self.passwordLabel.text = "Ваш пароль: "
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            userImage.widthAnchor.constraint(equalToConstant: 200),
            userImage.heightAnchor.constraint(equalToConstant: 200),
            
            helloLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: ourIndent),
            helloLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            helloLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            helloLabel.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: ourIndent),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            emailLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            
            passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            passwordLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            passwordLabel.heightAnchor.constraint(equalToConstant: 20),
            
            quitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -ourIndent),
            quitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            quitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            quitButton.heightAnchor.constraint(equalToConstant: 40),
            
            ])
            }
    
}
