//
//  ComposeViewController.swift
//  tumblrApp-om
//
//  Created by Olivia Muesse on 10/12/14.
//  Copyright (c) 2014 Olivia Muesse. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var nevermindButton: UIButton!
    @IBOutlet weak var textButton: UIImageView!
    @IBOutlet weak var photoButton: UIImageView!
    @IBOutlet weak var quoteButton: UIImageView!
    @IBOutlet weak var linkButton: UIImageView!
    @IBOutlet weak var chatButton: UIImageView!
    @IBOutlet weak var videoButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textButton.frame.origin.y = 600
        photoButton.frame.origin.y = 600
        quoteButton.frame.origin.y = 600
        linkButton.frame.origin.y = 600
        chatButton.frame.origin.y = 600
        videoButton.frame.origin.y = 600
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onNevermindButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
    
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.textButton.frame.origin.y = 125
            self.photoButton.frame.origin.y = 125
            self.quoteButton.frame.origin.y = 125
            self.linkButton.frame.origin.y = 261
            self.chatButton.frame.origin.y = 261
            self.videoButton.frame.origin.y = 261
            })
       
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
