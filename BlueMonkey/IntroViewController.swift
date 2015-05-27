//
//  IntroViewController.swift
//  BlueMonkey
//
//  Created by MELISSA LABBE on 1/15/15.
//  Copyright (c) 2015 MELISSA LABBE. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as IntroScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView:bmTitleView = bmTitleView()
        titleView.addBackgroundTreesAnimation()
        titleView.addBird02Animation()
        titleView.addBlueMonkeyAnimation()
        titleView.addCloudsAnimation()
        titleView.addMountainsAnimation()
        titleView.addSkyAnimation()
        titleView.addBird01Animation()
        self.view.addSubview(titleView)

    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let sceneOne = self.storyboard?.instantiateViewControllerWithIdentifier("SceneOne") as SceneOneViewController
            self.navigationController?.pushViewController(sceneOne, animated: true)
        }
        
    }
}
