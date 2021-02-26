//
//  ViewController.swift
//  spotifyconnectiondemo
//
//  Created by Sydney Chiang on 2/25/21.
//

import UIKit
import SafariServices
import AVFoundation

class ViewController: UIViewController, SPTAudioStreamingPlaybackDelegate, SPTAudioStreamingDelegate {
    var auth = SPTAuth.defaultInstance()
    var session: SPTSession!
    var player : SPTAudioStreamingController?
    var loginUrl: URL?
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAfterFirstLogin), name: NSNotification.Name(rawValue: "loginSuccessful"), object: nil)
        
        if UserDefaults.standard.bool(forKey: "loginSuccessful") == true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)

        }
        
//        SPTUser.requestCurrentUser(withAccessToken:(SPTAuth.defaultInstance().session.accessToken)!) { (error, data) in
//                guard let user = data as? SPTUser else { print("Couldn't cast as SPTUser"); return }
//                let userId = user.canonicalUsername
//        })
        

        
    }
    
    func setup(){
        let redirectURL = "TinderTunes://returnAfterLogin"
        _ = "cffc7e85c7e145ea8638f6ad7591356f"
        
        auth?.redirectURL = URL(string: redirectURL)
        auth!.clientID = "cffc7e85c7e145ea8638f6ad7591356f"
        auth?.requestedScopes = [SPTAuthStreamingScope, SPTAuthPlaylistReadPrivateScope, SPTAuthPlaylistModifyPublicScope, SPTAuthPlaylistModifyPrivateScope]
        loginUrl = auth?.spotifyWebAuthenticationURL() //might change this to web authentication
    }
    
    func initializePlayer(authSession: SPTSession){
        if self.player == nil{
            self.player = SPTAudioStreamingController.sharedInstance()
            self.player!.playbackDelegate = self
            self.player!.delegate = self
            try! player?.start(withClientId: auth?.clientID)
            self.player!.login(withAccessToken: authSession.accessToken)
        }
    }
    
    @objc func updateAfterFirstLogin () {
        let userDefaults = UserDefaults.standard
        if let sessionObj:AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject?{
            let sessionDataObj = sessionObj as! Data
//            let firstTimeSession = NSKeyedUnarchiver.unarchivedObject(ofClass: SPTSession(), from: sessionDataObj)
            let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
            self.session = firstTimeSession
            initializePlayer(authSession: session)
        }
    }
    

    @IBAction func loginTapped(_ sender: Any) {
        if UIApplication.shared.openURL(loginUrl!){
            if ((auth?.canHandle(auth?.redirectURL)) != nil){
                //to do something
            }
        }
    }
    
    func audioStreamingDidLogin(audioStreaming: SPTAudioStreamingController){
        print("Logged in")
    }
    
}

