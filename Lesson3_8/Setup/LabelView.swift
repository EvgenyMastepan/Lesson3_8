//
//  LabelView.swift
//  Lesson3_8
//
//  Created by Evgeny Mastepan on 26.01.2025.
//

import UIKit

class LabelView: UILabel {
    init(font: UIFont = .systemFont(ofSize: 32, weight: .light), aligment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .systemBlue
        self.numberOfLines = 0
        self.textAlignment = aligment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
