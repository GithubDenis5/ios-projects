//
//  UIKitWrapper.swift
//  fourth_project
//
//  Created by Денис Громачихин on 14.02.2026.
//

import SwiftUI

struct UIKitWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        return UIKitListViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
