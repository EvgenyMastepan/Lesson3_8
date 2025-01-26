//
//  AutorizationView.swift
//  Lesson3_8
//
//  Created by Evgeny Mastepan on 26.01.2025.
//

import UIKit

protocol AutorizationViewProtocol: AnyObject{
    
}

class AutorizationView: UIViewController, AutorizationViewProtocol{
    
    var presenter: AutorizationPresenterProtocol!
    private let ourIndent: CGFloat = 20
    
    private lazy var titleLabel = LabelView()
    
    private lazy var emailText = TextFieldView(placeholder: "электропочта")
    private lazy var passwordText = TextFieldView(placeholder: "пароль", secure: true)
        
    private lazy var enterButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemBlue
        $0.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        $0.setTitle(" Войти", for: .normal)
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: presenter.action))

    private lazy var registrationLabel = LabelView(font: .systemFont(ofSize: 14, weight: .regular), aligment: .center)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textInit()
        view.addSubviews(titleLabel, emailText, passwordText, enterButton, registrationLabel)
        setupConstraint()
    }
    
    private func textInit(){
        self.titleLabel.text = "Авторизация"
        self.emailText.text = ""
        self.passwordText.text = ""
        self.registrationLabel.text = "регистрация"
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            emailText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ourIndent),
            emailText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            emailText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            emailText.heightAnchor.constraint(equalToConstant: 40),
            
            passwordText.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: ourIndent),
            passwordText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            passwordText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            passwordText.heightAnchor.constraint(equalToConstant: 40),
                      
            registrationLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -ourIndent),
            registrationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            registrationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            registrationLabel.heightAnchor.constraint(equalToConstant: 40),
            
            enterButton.bottomAnchor.constraint(equalTo: registrationLabel.topAnchor),
            enterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            enterButton.heightAnchor.constraint(equalToConstant: 40),
            ])
            }
    
}

