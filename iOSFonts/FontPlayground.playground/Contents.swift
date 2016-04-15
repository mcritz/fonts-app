//: Playground - noun: a place where people can play

import UIKit

let someFonts = UIFont.familyNames()

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

someFonts.map { family in
	let font_name = UIFont(name: family, size: 32)
}

let some_characters = getCharacters(UIFont(name: "HiraMinProN-W6", size: 24))

some_characters.length
