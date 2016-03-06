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
    
    @IBOutlet var label0: UILabel!
    @IBOutlet var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize soundController
        let soundController = SoundController()
        soundController.setSessionPlayback()
        voiceover = soundController.setupAudioPlayerWithFile("encoded_audio",type: "aif");
        //backgroundMusic.play()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "actOnSpecialNotification", name: notificationKey, object: nil)

        
        
        label0.textColor = UIColor.blueColor()
        
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
    
    func actOnSpecialNotification() {
        println("Cuepoint changed")
    }

}
