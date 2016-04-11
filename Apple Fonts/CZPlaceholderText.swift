//
//  CZPlaceholderText.swift
//  Apple Fonts
//
//  Created by Michael Critz on 4/10/16.
//  Copyright © 2016 Map of the Unexplored. All rights reserved.
//

import Foundation

class CZPlaceholderText {
	
	let adjectives = ["Flying", "Dark", "Black", "Red", "Silver", "Hollow", "Blonde", "Thin", "Fat", "Ancient", "Silent", "Smoke", "Fair", "Prismatic"]
	
	let nouns = ["Ajax", "Garden", "Gem", "Crystal", "Anger", "Truce", "Knight", "Sky", "River", "Mountain", "Fortress", "Assassin", "Thief", "Prize", "Eye", "Arm", "Knife", "Axe", "Queen", "Juggernaught", "Butler", "Dye", "Jynx"]
	
	func getRandom(sourceArrays: [[String]]) -> String {
		var randomString = String()
		sourceArrays.map{ someArray in
			let rand = arc4random_uniform(UInt32(someArray.count))
			randomString.appendContentsOf(someArray[Int(rand)] + " ")
		}
		return randomString
	}
	
	func getPlaceholder() -> String {
		return getRandom([adjectives, nouns])
	}
}