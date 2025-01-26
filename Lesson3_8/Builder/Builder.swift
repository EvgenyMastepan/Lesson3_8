//
//  Builder.swift
//  Lesson3_8
//
//  Created by Evgeny Mastepan on 26.01.2025.
//

import UIKit
class Builder {
    static func createWelcomeView() -> UIViewController{
        let vc = WelcomeView()
        let presenter = WelcomePresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
    static func createAutorizationView() -> UIViewController{
        let vc = AutorizationView()
        let presenter = AutorizationPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
    static func createRegistrationView() -> UIViewController{
        let vc = RegistrationView()
        let presenter = RegistrationPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
    
}
