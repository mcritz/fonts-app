//
//  FontTableViewController.swift
//  Apple Fonts
//
//  Created by Michael Critz on 4/7/16.
//  Copyright © 2016 Map of the Unexplored. All rights reserved.
//

import UIKit

class FontTableCell: UITableViewCell {
	@IBOutlet var headlineLabel :UILabel!
	@IBOutlet weak var subheadlineLabel: UILabel!
	
	func getHeight() -> CGFloat {
		return self.contentView.frame.height * 0.5
	}
	
	func configureCell(some_title :String, font_name :String) {
		self.headlineLabel.text = some_title
		headlineLabel.font = UIFont(name: font_name, size: getHeight())
		
		self.subheadlineLabel.text = font_name
	}
}

class FontTableViewController: UITableViewController {
	
	let fontManager = CZFont()
	
	let all_faces = CZFont().all_faces
	
	let placeholder_text = CZPlaceholderText().getPlaceholder()

    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = NSLocalizedString("Installed Fonts", comment: "")
		
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return all_faces.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fontManager.getFaces(all_faces[section]).count
    }
	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell :FontTableCell = tableView.dequeueReusableCellWithIdentifier("font_face_cell", forIndexPath: indexPath) as! FontTableCell
		
		let face_name = fontManager.getFaces(all_faces[indexPath.section])[indexPath.row]
		
		cell.configureCell(placeholder_text, font_name: face_name)
		return cell
    }
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return all_faces[section]
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
