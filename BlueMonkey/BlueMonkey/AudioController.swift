//
//  AudioController.swift
//  BlueMonkey
//
//  Created by MELISSA LABBE on 6/14/15.
//  Copyright (c) 2015 MELISSA LABBE. All rights reserved.
//

import Foundation
import AVFoundation

/**
Plays an audion file (MP3) using an AVAudioPlayer
*/

class SoundController : NSObject {
    
    var avPlayer:AVAudioPlayer!
    var mp:AVMIDIPlayer!
    var soundbank:NSURL!
    var session:AVAudioSession!
    
    override init() {
        super.init()
        readFileIntoAVPlayer()
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
    
    func stopAVPLayer() {
        if avPlayer.playing {
            avPlayer.stop()
            //self.playerTimer.invalidate()
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
    func readFileIntoAVPlayer() {
        
        let fileURL:NSURL = NSBundle.mainBundle().URLForResource
        //let fileURL:String? = NSBundle.mainBundle().pathForResource("encoded_audio", ofType: "aif")
        
        // the player must be a field. Otherwise it will be released before playing starts.
        var error: NSError?
        //        self.avPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: &error)
        self.avPlayer = AVAudioPlayer(contentsOfURL: fileURL, fileTypeHint: AVFileTypeAIFF, error: &error)
        if avPlayer == nil {
            if let e = error {
                println(e.localizedDescription)
            }
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector:"sessionInterrupted:",
            name:AVAudioSessionInterruptionNotification,
            object:avPlayer)
        
        println("playing \(fileURL)")
        avPlayer.delegate = self
        avPlayer.prepareToPlay()
        avPlayer.volume = 1.0
        
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
    }
    
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        println("\(error.localizedDescription)")
    }
    
}