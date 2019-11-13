//
//  Scene.swift
//  ARKitFromScratch
//
//  Created by Brian Advent on 27.05.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    // Use sceneView to see where the user touches the screen or touches our sceneView
    // Being by overriding touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let sceneView = self.view as? ARSKView else {return}
        
        // Need to get touch location
        if let touchLocation = touches.first?.location(in: sceneView) {
            // Can now perform a hitTest
            // featurePoint, get 3D point in real world to use to add an acnhor to this, which is where we'll place
            // 'character_1.png' image
            // hitTest-> returns an array of hitTest results, only interested in the first result
            if let hit = sceneView.hitTest(touchLocation, types: .featurePoint).first {
                sceneView.session.add(anchor: ARAnchor(transform: hit.worldTransform)) // Add anchor here
                // transform expects a matrix
                // Once we add an anchor, need to process it in the ViewController
            }
        }
    }
}
