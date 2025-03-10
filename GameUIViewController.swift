//
//  GameUIViewController.swift
//  JengAR
//
//  Created by Tara Yin on 02/28/2025.
//

import UIKit
import SceneKit
import ARKit

class GameUIViewController: UIViewController, SCNSceneRendererDelegate{
    var delegate: GameUIViewControllerDelegate! = nil
    let scene = SCNScene()
    let sceneView = SCNView()
    let thickness = 0.02
    
    func generateBlock(layer: Int, numInLayer: Int,
                       color: UIColor = UIColor.green){
        let x = layer % 2 != 0 ? 0 : Double(numInLayer) * thickness - (thickness * 2)
        let z = layer % 2 == 0 ? 0 : Double(numInLayer) * thickness - (thickness * 2)
        let blockNode = SCNNode(geometry: SCNBox(width: thickness, height: thickness, length: thickness * 3, chamferRadius: 0.002))
        blockNode.geometry?.materials.first?.diffuse.contents = color
        blockNode.eulerAngles = SCNVector3(x: 0, y: layer % 2 == 0 ? 0 : Float.pi / 2, z: 0)
        blockNode.position = SCNVector3(x: Float(x), y: Float(Double(layer) * thickness), z: Float(z))
        blockNode.name = "block\(layer)\(numInLayer)"
        scene.rootNode.addChildNode(blockNode)
    }
    
    
    func placeBlocks(layers: Int = 10){
        for i in 1...layers{
            for s in 1...3{
                generateBlock(layer: i, numInLayer: s)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeBlocks(layers: 10)
        
        sceneView.frame = view.frame
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.delegate = self
        
        view.addSubview(sceneView)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, didSimulatePhysicsAtTime time: TimeInterval) {
        
    }
}

protocol GameUIViewControllerDelegate {
    
}
