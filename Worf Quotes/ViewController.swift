//
//  ViewController.swift
//  Worf Quotes
//
//  Created by Paul Greidanus on 2015-11-11.
//  Copyright © 2015 Paul Greidanus. All rights reserved.
//

import UIKit
import iAd
import AVFoundation

class ViewController: UIViewController {
    // No Rotation
    /*
    override func shouldAutorotate() -> Bool {
        if (UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.Unknown) {
                return false
        }
        else {
            return true
        }
    }
    */

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait ,UIInterfaceOrientationMask.PortraitUpsideDown]
    }

    @IBOutlet weak var nameTextField: UIButton!
    
// Advertising Goop
    var rectangleAdView: ADBannerView?
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.view.addSubview(banner)
        self.view.layoutIfNeeded()
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        banner.removeFromSuperview()
        self.view.layoutIfNeeded()
    }
    
    // Setup the sound files
    var soundJoke: AVAudioPlayer?
    var soundSmirk: AVAudioPlayer?
    var soundStand: AVAudioPlayer?
    var soundEating: AVAudioPlayer?
    var soundWalk: AVAudioPlayer?
    var soundConcern: AVAudioPlayer?
    var soundThinking: AVAudioPlayer?
    var soundWinning: AVAudioPlayer?
    var soundWarriorDrink: AVAudioPlayer?
    var soundMerryMan: AVAudioPlayer?
    var soundDialated: AVAudioPlayer?
    var soundWomen: AVAudioPlayer?
    var soundTea: AVAudioPlayer?
    var playing = AVAudioPlayer()
    
    // Setup the AV Player
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Text Field
        //nameTextField.setTitle(<#T##title: String?##String?#>, forState: <#T##UIControlState#>)
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blackColor()
        // Allow Banner Ads
        self.canDisplayBannerAds = true
        // Setup the sound files
        if let soundJoke = self.setupAudioPlayerWithFile("joke", type:"mp3") {self.soundJoke = soundJoke}
        if let soundSmirk = self.setupAudioPlayerWithFile("smirk", type:"mp3") {self.soundSmirk = soundSmirk}
        if let soundStand = self.setupAudioPlayerWithFile("killstand", type:"mp3") {self.soundStand = soundStand}
        if let soundEating = self.setupAudioPlayerWithFile("eating", type:"mp3") {self.soundEating = soundEating}
        if let soundWalk = self.setupAudioPlayerWithFile("walk", type:"mp3") {self.soundWalk = soundWalk}
        if let soundConcern = self.setupAudioPlayerWithFile("notconcern", type:"mp3") {self.soundConcern = soundConcern}
        if let soundThinking = self.setupAudioPlayerWithFile("thinking", type:"mp3") {self.soundThinking = soundThinking}
        if let soundWinning = self.setupAudioPlayerWithFile("winning", type:"mp3") {self.soundWinning = soundWinning}
        if let soundWarriorDrink = self.setupAudioPlayerWithFile("warriordrink", type:"mp3") {self.soundWarriorDrink = soundWarriorDrink}
        if let soundMerryMan = self.setupAudioPlayerWithFile("merryman", type:"mp3") {self.soundMerryMan = soundMerryMan}
        if let soundDialated = self.setupAudioPlayerWithFile("dialated", type:"mp3") {self.soundDialated = soundDialated}
        if let soundWomen = self.setupAudioPlayerWithFile("women", type:"mp3") {self.soundWomen = soundWomen}
        if let soundTea = self.setupAudioPlayerWithFile("tea", type:"mp3") {self.soundTea = soundTea}
        playing=soundJoke!
    }

    // Sound events to tie to button
    @IBAction func sndJoke(sender: AnyObject) {playing.stop(); playing=soundJoke!; soundJoke?.play()}
    @IBAction func sndConcern(sender: AnyObject) {playing.stop(); playing=soundConcern!; soundConcern?.play()}
    @IBAction func sndSmirk(sender: AnyObject) {playing.stop() ;playing=soundSmirk!; soundSmirk?.play()}
    @IBAction func sndMerry(sender: AnyObject) {playing.stop() ;playing=soundMerryMan!; soundMerryMan?.play()}
    @IBAction func sndWomen(sender: AnyObject) {playing.stop() ;playing=soundWomen!; soundWomen?.play()}
    @IBAction func sndTea(sender: AnyObject) {playing.stop() ; playing=soundTea!; soundTea?.play()}
    @IBAction func sndDialated(sender: AnyObject) {playing.stop(); playing=soundDialated!; soundDialated?.play()}
    @IBAction func sndWalk(sender: AnyObject) {playing.stop(); playing=soundWalk!; soundWalk?.play()}
    @IBAction func sndWarrior(sender: AnyObject) {playing.stop(); playing=soundWalk!; soundWarriorDrink?.play()}
    @IBAction func sndEating(sender: AnyObject) {playing.stop(); playing=soundEating!; soundEating?.play()}
    @IBAction func sndWinning(sender: AnyObject) {playing.stop(); playing=soundWinning!; soundWinning?.play()}
    @IBAction func sndKill(sender: AnyObject) {playing.stop(); playing=soundStand!; soundStand?.play()}
    @IBAction func sndThinking(sender: AnyObject) {playing.stop(); playing=soundThinking!; soundThinking?.play()}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

