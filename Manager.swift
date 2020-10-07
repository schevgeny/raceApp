//
//  Ьфтфпук.swift
//  race_sssr
//
//  Created by Eugene sch on 8/5/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation

//
//  Manager.swift
//  project_1
//
//  Created by Eugene sch on 7/7/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Manager {
    static let shared  = Manager()
    
    private init() {}
    
    var speed = 0.7
    var carPosition = 1
    var result = 0
    var isStop = false
    
    var timer: Timer?
    private var audioPlayer: AVAudioPlayer?
    
    var displayView: UIView?
    
    let speedStep = 0.1
    let speedStart = 0.7
    
    func stopGame() {
        self.timer?.invalidate()
        self.timer = nil
        print("stop")
        isStop = true
        
        var dataResults: [Result] = UserDefaults.standard.value([Result].self, forKey: "results") ?? []
        let result = Result()
        result.date = Date()
        result.exp = self.result
        result.name = "name"
        dataResults.append(result)
        UserDefaults.standard.set(encodable: dataResults, forKey: "results")
        stopAudio()
    }
    
    func speedLvl() -> String {
        return String(format: "%.0f", (speedStart - speed) / speedStep + 1 )
    }
    
    func speedUp(){
        if Int(speedLvl()) == 7 {
            return
        }
        speed -= speedStep
    }
    func speedDown(){
        if Int(speedLvl()) == 1 {
            return
        }
        speed += speedStep
    }
    
    func gameStart(){
        isStop = false
        result = 0
        carPosition = 1
        speed = speedStart - Double( SettingManager.shared.data.spartSpeed - 1) * speedStep
        playAudio()
    }
    
    func playAudio() {
        if SettingManager.shared.data.volumeOn == false {
            return
        }
        guard let path = Bundle.main.path(forResource: "background", ofType: "mp3"),
              let sound = URL(fileURLWithPath: path) as? URL else {
            return
            
        }
        
        try! AVAudioSession.sharedInstance().setCategory(.playback)
        try! AVAudioSession.sharedInstance().setActive(true)
        
        try! audioPlayer = AVAudioPlayer(contentsOf: sound)
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
        audioPlayer?.volume = SettingManager.shared.data.volume
    }
    
    func stopAudio() {
        if let player = self.audioPlayer {
            player.stop()
        }
    }
    
}
