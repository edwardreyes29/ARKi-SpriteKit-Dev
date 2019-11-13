//
//  ViewController.swift
//  ARKitFromScratch
//
//  Created by Brian Advent on 27.05.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet var sceneView: ARSKView! // Outlet for ARSKView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self // assing our scene view id outlet, access its delegate property, assing self to get notifications from below
        
        // Create a scene object
        if let scene = SKScene(fileNamed: "Scene") { // pass in file name of Scene.sks
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // When overridign, must call super and pass in paramter
        
        let configuration = ARWorldTrackingConfiguration()
        // sceneView holds AR session, can now run sceneView session with configuration
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // will pause session when view disappears
        sceneView.session.pause()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// Adopt this protocol by extending our ViewController (to keep things clean)
extension ViewController : ARSKViewDelegate {
    
    /*func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        <#code#>
    }*/
    
    // If you want tomodify the transform of your content, add them as children in this function
    // GOAL: modify x-scale to the png image
    func view(_ view: ARSKView, didAdd node: SKNode, for anchor: ARAnchor) {
        let characterNode = SKSpriteNode(imageNamed: "character_1")
        characterNode.xScale = 0.25
        characterNode.yScale = 0.25
        
        // Add node as a child here to the node as a param
        node.addChild(characterNode)
    }
    
    // These are the three available delegate functions to inform users about problems or information that you get fomrARKit.
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
    }
    
}

