//
//  AudioController.swift
//  BlueMonkey
//
//  Created by MELISSA LABBE on 6/14/15.
//  Copyright (c) 2015 MELISSA LABBE. All rights reserved.
//

import Foundation
import AVFoundation

//Globally define a "special notification key" constant that can be broadcast / tuned in to...
let notificationKey = "com.bluemonkey"

/**
Plays an audion file (MP3) using an AVAudioPlayer
*/

class SoundController : NSObject {
    
    var avPlayer:AVAudioPlayer!
    var session:AVAudioSession!
    var timer:NSTimer!
    var currentTrack:String!
    
    var cuepointDict = [
        "encoded_audio": [0.79, 1.22, 1.54, 1.79, 2.67, 2.90, 3.33, 3.59, 3.78, 3.93, 4.88, 5.14, 5.33, 5.46, 5.70, 5.99]
    
    ]
    
    override init() {
        super.init()
        
    }
    
    func setSessionPlayback() {
        session = AVAudioSession.sharedInstance()
        var error: NSError?
        var isPlaying = session.otherAudioPlaying;
        if !session.setCategory(AVAudioSessionCategorySoloAmbient, error: &error) {
            println("could not set session category")
            if let e = error {
                println(e.localizedDescription)
            }
        }
        if !session.setActive(true, error: &error) {
            println("could not make session active")
            if let e = error {
                println(e.localizedDescription)
            }
        }
        if(isPlaying){
            //TODO: mute game soundtrack here
        }
    }
    
    func checkCuePoint(){
        let playerTime = self.avPlayer.currentTime
        let cuePoints = cuepointDict[currentTrack]!
        
        for (index,cue) in enumerate(cuePoints){
            if(cue > playerTime){
                println("\(index):\(cue)")
                NSNotificationCenter.defaultCenter().postNotificationName(notificationKey, object: self)

                break
            }
        }
    }
    
    func startPolling(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "checkCuePoint", userInfo: nil, repeats: true)
    }
    
    func stopAVPLayer() {
        if avPlayer.playing {
            avPlayer.stop()
            timer.invalidate()
        }
    }
    
    func toggleAVPlayer() {
        println("is playing \(avPlayer.playing)")
        if avPlayer.playing {
            avPlayer.pause()
        } else {
            setSessionPlayback()
            avPlayer.play()
            //            self.playerTimer = NSTimer.scheduledTimerWithTimeInterval(1,
            //                target:self,
            //                selector:"updatePlayerStatus:",
            //                userInfo:nil,
            //                repeats:true)
        }
    }
    
    /**
    Uses AvAudioPlayer to play a sound file.
    The player instance needs to be an instance variable. Otherwise it will disappear before playing.
    */
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
        currentTrack = file
        var path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        var url = NSURL.fileURLWithPath(path!)
        var error: NSError?
        avPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        avPlayer.delegate = self
        avPlayer.prepareToPlay()
        avPlayer.play()
        startPolling()
        
        return avPlayer!
    }

    // MARK: notification callbacks
    func sessionInterrupted(notification:NSNotification) {
        println("audio session interrupted")
        var p = notification.object as AVAudioPlayer
        p.stop()
    }
    
}


// MARK: AVAudioPlayerDelegate
extension SoundController : AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        println("finished playing \(flag)")
        timer.invalidate()
    }
    
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        println("\(error.localizedDescription)")
    }
    
}