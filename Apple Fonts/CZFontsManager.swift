//
//  CZFontsManager.swift
//  Apple Fonts
//
//  Created by Michael Critz on 4/7/16.
//  Copyright © 2016 Map of the Unexplored. All rights reserved.
//

//import Foundation
import UIKit

class CZFont {
	
	var all_faces :[String]
	
	init() {
		all_faces = UIFont.familyNames()
		all_faces = all_faces.sort()
	}
	
	func getFonts() -> AnyObject {
		let font_data = all_faces.map{ family_name -> AnyObject in
			let these_faces = [UIFont.fontNamesForFamilyName(family_name)]
			guard these_faces.count > 0 else { return [] }
			
			let face_data = these_faces[0].map{ face_name in
				return [
					"platforms" : [ "appletv" : ["version" : 9.0] ],
					"font_face" : face_name
				]
			}
			let some_font_data = [
				"family_name" : family_name,
				"faces" : face_data
			]
			return some_font_data
		}
		return font_data
	}
	
	func getFaces(family: String) -> [String] {
		return UIFont.fontNamesForFamilyName(family)
	}
	
	func jsonify(someData: AnyObject?) -> NSData? {
		guard let someData :AnyObject = someData! else { return nil }
		var jsonData = NSData()
		do {
			try jsonData = NSJSONSerialization.dataWithJSONObject(someData, options: .PrettyPrinted)
		} catch {
			print(error)
		}
		return jsonData
	}
	
	func writeFile(name: String, data: NSData?) {
		guard let fileData :NSData = data! else { return }
		let fileUrl :NSURL = NSURL(fileURLWithPath: NSHomeDirectory() + name)
		print(fileUrl)
		do {
			try fileData.writeToURL(fileUrl, options: .AtomicWrite)
		} catch {
			print(error)
		}
	}
	
	func saveFonts() {
		writeFile("tv_os.json", data: jsonify(getFonts()))
	}
}
