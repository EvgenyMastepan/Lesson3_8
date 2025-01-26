//
//  TextFieldView.swift
//  Lesson3_8
//
//  Created by Evgeny Mastepan on 26.01.2025.
//

import UIKit

class TextFieldView: UITextField {
    init(font: UIFont = .systemFont(ofSize: 14, weight: .thin), placeholder: String, secure: Bool = false) {
        super.init(frame: .zero)
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        self.leftViewMode = .always
        self.leftView = spacerView
        self.font = font
        if secure { self.isSecureTextEntry = true } else { self.isSecureTextEntry = false }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .systemBlue
        self.placeholder = placeholder
        self.clearButtonMode = .whileEditing
        self.borderStyle = .line
        self.layer.borderColor = CGColor(red: 20, green: 20, blue: 20, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
