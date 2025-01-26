//
//  RegistrationView.swift
//  Lesson3_8
//
//  Created by Evgeny Mastepan on 26.01.2025.
//

import UIKit

protocol RegistrationViewProtocol: AnyObject{
    
    
}

class RegistrationView: UIViewController, RegistrationViewProtocol{
    
    var presenter: RegistrationPresenterProtocol!
    private let ourIndent: CGFloat = 20
    
    private lazy var titleLabel = LabelView()
    private lazy var userPicker: UIImagePickerController = {
        $0.delegate = self
        $0.mediaTypes = ["public.image"]
        $0.sourceType = .savedPhotosAlbum
        return $0
    }(UIImagePickerController())
    lazy var userImage: UIImageView = {
        let panGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        $0.addGestureRecognizer(panGesture)
        $0.image = UIImage(systemName: "person.crop.square.fill")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.isUserInteractionEnabled = true
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var nameText = TextFieldView(placeholder: "имя")
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
    }(UIButton())
    
    @objc func tapImage(sender: UIPanGestureRecognizer){
        DispatchQueue.main.async { [ weak self ] in
                    guard let self = self else { return }
            self.present(self.userPicker, animated: true, completion: nil)
                }
        
    }
    private lazy var registrationLabel = LabelView(font: .systemFont(ofSize: 14, weight: .regular), aligment: .center)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textInit()
        view.addSubviews(titleLabel, userImage, nameText, emailText, passwordText, enterButton, registrationLabel)
        setupConstraint()
    }
    
    private func textInit(){
        self.titleLabel.text = "Регистрация"
        self.emailText.text = ""
        self.passwordText.text = ""
        self.registrationLabel.text = "есть аккаунт"
    }
    
    
    
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            userImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ourIndent),
            userImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            userImage.widthAnchor.constraint(equalToConstant: 200),
            userImage.heightAnchor.constraint(equalToConstant: 200),
            
            nameText.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: ourIndent),
            nameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ourIndent),
            nameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ourIndent),
            nameText.heightAnchor.constraint(equalToConstant: 40),
            
            emailText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: ourIndent),
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


