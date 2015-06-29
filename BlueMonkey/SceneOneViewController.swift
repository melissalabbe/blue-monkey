//
//  SceneOneViewController.swift
//  BlueMonkey
//
//  Created by MELISSA LABBE on 1/15/15.
//  Copyright (c) 2015 MELISSA LABBE. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import Foundation

class SceneOneViewController: UIViewController, AVAudioPlayerDelegate {
    
    var voiceover = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize soundController
        let soundController = SoundController()
        soundController.setSessionPlayback()
        voiceover = soundController.setupAudioPlayerWithFile("encoded_audio",type: "aif");
        //backgroundMusic.play()
        
        if let scene = SceneOne.unarchiveFromFile("SceneOne") as? SceneOne {
            // Configure the view.
            let skView = self.view as SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            scene.size = skView.bounds.size
            skView.presentScene(scene)
        }
    }
}
