//
//  PhotoPickerSettings.swift
//  Lesson3_8
//
//  Created by Evgeny Mastepan on 26.01.2025.
//

import UIKit

extension RegistrationView: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.mediaType] as? String == "public.image"{
            self.handlePhoto(info)
        } else { print("DEBUG: Media was neither Image.") }
        DispatchQueue.main.async { [ weak self ] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    func handlePhoto(_ info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[.originalImage] as? UIImage{
            self.userImage.image = image
        }
    }
}
