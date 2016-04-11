//
//  CZPlaceholderText.swift
//  Apple Fonts
//
//  Created by Michael Critz on 4/10/16.
//  Copyright © 2016 Map of the Unexplored. All rights reserved.
//

import UIKit

class CZPlaceholderText {
	
	func getRandom(sourceArrays: [[String]]) -> String {
		var randomString = String()
		for someArray in sourceArrays {
			let rand = arc4random_uniform(UInt32(someArray.count))
			randomString.appendContentsOf(someArray[Int(rand)] + " ")
		}
		return randomString
	}
	
	enum Strings {
		case Adjectives
		case Nouns
		case Pangrams
		func content() -> [String] {
			switch self {
			case .Adjectives:
				return ["Flying", "Dark", "Black", "Red", "Silver", "Hollow", "Blonde", "Thin", "Fat", "Ancient", "Silent", "Smoke", "Fair", "Prismatic", "Acidic"]
			case .Nouns:
				return ["Ajax", "Garden", "Gem", "Sigil", "Crystal", "Anger", "Truce", "Knight", "Sky", "River", "Mountain", "Fortress", "Assassin", "Thief", "Prize", "Eye", "Arm", "Knife", "Axe", "Queen", "Juggernaught", "Butler", "Dye", "Jynx"]
			case .Pangrams:
				return ["Forsaking monastic tradition, twelve jovial friars gave up their vocation for a questionable existence on the flying trapeze",
				        "No kidding -- Lorenzo called off his trip to visit Mexico City just because they told him the conquistadores were extinct",
				        "Jelly-like above the high wire, six quaking pachyderms kept the climax of the extravaganza in a dazzling state of flux",
				        "Ebenezer unexpectedly bagged two tranquil aardvarks with his jiffy vacuum cleaner",
				        "Six javelins thrown by the quick savages whizzed forty paces beyond the mark",
				        "The explorer was frozen in his big kayak just after making queer discoveries",
				        "The July sun caused a fragment of black pine wax to ooze on the velvet quilt",
				        "The public was amazed to view the quickness and dexterity of the juggler",
				        "While Suez sailors wax parquet decks, Afghan Jews vomit jauntily abaft",
				        "We quickly seized the black axle and just saved it from going past him",
				        "Six big juicy steaks sizzled in a pan as five workmen left the quarry",
				        "While making deep excavations we found some quaint bronze jewelry",
				        "Jaded zombies acted quaintly but kept driving their oxen forward",
				        "A mad boxer shot a quick, gloved jab to the jaw of his dizzy opponent",
				        "The job requires extra pluck and zeal from every young wage earner",
				        "A quart jar of oil mixed with zinc oxide makes a very bright paint",
				        "Whenever the black fox jumped the squirrel gazed suspiciously",
				        "We promptly judged antique ivory buckles for the next prize",
				        "How razorback-jumping frogs can level six piqued gymnasts",
				        "Crazy Fredericka bought many very exquisite opal jewels",
				        "Sixty zippers were quickly picked from the woven jute bag",
				        "Amazingly few discotheques provide jukeboxes",
				        "Heavy boxes perform quick waltzes and jigs",
				        "Jinxed wizards pluck ivy from the big quilt",
				        "Big Fuji waves pitch enzymed kex liquor",
				        "The quick brown fox jumps over a lazy dog",
				        "Pack my box with five dozen liquor jugs",
				        "Jackdaws love my big sphinx of quartz",
				        "The five boxing wizards jump quickly",
				        "How quickly daft jumping zebras vex",
				        "Quick zephyrs blow, vexing daft Jim",
				        "Sphinx of black quartz, judge my vow",
				        "Waltz, nymph, for quick jigs vex Bud",
				        "Blowzy night-frumps vex'd Jack Q",
				        "Glum Schwartzkopf vex'd by NJ IQ",
				        "Jump by vow of quick, lazy strength in Oxford",
				        "The quick brown fox jumps over a lazy dog",
				        "Sphinx of black quartz: judge my vow",
				        "Mr. Jock, TV quiz PhD, bags few lynx",
				        "Cwm fjord-bank glyphs vext quiz",
				        "Blowzy night-frumps vex'd Jack Q",
				        "Squdgy fez, blank jimp crwth vox",
				        "TV quiz drag nymphs blew JFK cox",
				        "Q-kelt vug dwarf combs jynx phiz"]
			}
		}
	}
	
	func getPlaceholder() -> String {
		return getRandom([Strings.Pangrams.content()])
	}
	
	func getCharacters(font_name :UIFont?) -> NSAttributedString {
		let attributed_string = NSMutableAttributedString()
		let letter_characters :NSCharacterSet = CTFontCopyCharacterSet(font_name!)
		for idx: unichar in 0...1024
		{
			if (
				letter_characters.characterIsMember(idx)
					&& NSCharacterSet.alphanumericCharacterSet().characterIsMember(idx)
				)
			{
				let font_character = String(UnicodeScalar(idx))
				
				attributed_string.appendAttributedString(NSAttributedString(string:font_character, attributes: [NSFontAttributeName:font_name!]))
				
			}
		}
		return attributed_string
	}
}