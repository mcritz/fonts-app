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
	
	func getFonts() -> [[String:[String]]] {
		let font_data = all_faces.map{ family_name -> [String:[String]] in
			return [family_name:UIFont.fontNamesForFamilyName(family_name)]
		}
		return font_data
	}
	
	func getFaces(family: String) -> [String] {
		return UIFont.fontNamesForFamilyName(family)
	}
	
	func jsonify(someData: [[String:[String]]]) -> NSData? {
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
