//
//  AudioPlayer.swift
//  Restart-SwiftUI
//
//  Created by Mahan Kheirollahi on 7/4/24.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound (sound:String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Could not find the sound file")
        }
    }
}