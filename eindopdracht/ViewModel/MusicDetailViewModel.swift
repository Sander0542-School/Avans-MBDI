//
//  MusicDetailViewModel.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 01/04/2022.
//

import Foundation
import AVFoundation


class MusicDetailViewModel: ObservableObject {
	
	func readText(_ text:String){
		if let language = NSLinguisticTagger.dominantLanguage(for: text) {
			let utterance = AVSpeechUtterance(string: text)
			utterance.voice = AVSpeechSynthesisVoice(language: language)
			
			//control speed and pitch
			utterance.pitchMultiplier = 1
			utterance.rate = 0.2
			
			let synth = AVSpeechSynthesizer()
			synth.speak(utterance)
			
		} else {
			print("Unknown language")
		}
	}
	
}
