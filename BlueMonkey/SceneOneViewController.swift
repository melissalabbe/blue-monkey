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
    var labels = [UILabel]()
    
    @IBOutlet var label0: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label8: UILabel!
    @IBOutlet var label9: UILabel!
    @IBOutlet var label10: UILabel!
    @IBOutlet var label11: UILabel!
    @IBOutlet var label12: UILabel!
    @IBOutlet var label13: UILabel!
    @IBOutlet var label14: UILabel!
    @IBOutlet var label15: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //collect labels
        labels = [label0, label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, label14, label15]
        
        //initialize soundController
        let soundController = SoundController()
        soundController.setSessionPlayback()
        voiceover = soundController.setupAudioPlayerWithFile("encoded_audio",type: "aif");
        //backgroundMusic.play()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onCuePoint", name: notificationKey, object: nil)

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
    
    func onCuePoint() {
        var label = labels[currentCuepoint]
        label.textColor = UIColor.magentaColor()
    }

}
