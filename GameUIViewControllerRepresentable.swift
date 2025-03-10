//
//  GameViewControllerRepresentable.swift
//  JengAR
//
//  Created by Tara Yin on 02/28/2025.
//

import SwiftUI
import SceneKit
import ARKit

struct GameUIViewControllerRepresentable: UIViewControllerRepresentable{
    
    let gameController: GameController
    
    
    
    func makeUIViewController(context: Context) -> GameUIViewController {
        let viewController = GameUIViewController()
        viewController.delegate = context.coordinator
        
        return viewController
    }

    func updateUIViewController(_ uiViewController: GameUIViewController, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

class Coordinator: GameUIViewControllerDelegate{
    
}

