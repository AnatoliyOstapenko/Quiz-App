//
//  Sound.swift
//  Quiz App
//
//  Created by MacBook on 10.07.2021.
//

import Foundation
import AVFoundation

struct Sound {
    // audio player variable initialized from AVFoundation
    var audioPlayer = AVAudioPlayer()

    
    
    mutating func playSound(_ getSound: String) {
        
        //  create URL session
        //  change a name tittle to pressedButton
        let url = Bundle.main.url(forResource: getSound, withExtension: "wav")
        
        //  url became optional, so I have to unwrap url, I use guard (it's shortage way)
        guard url != nil else {
            return
        }
        // Create the audio player and play the a sound from url session
        // transfer to variable URL session, add try, and add do - carch block
        // also I have to add exclamation mark to url
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.play()
            
        } catch {
            print("error popped up, let's RFM again")
        }
    }
    
}
