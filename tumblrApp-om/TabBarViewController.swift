//
//  TabBarViewController.swift
//  tumblrApp-om
//
//  Created by Olivia Muesse on 10/12/14.
//  Copyright (c) 2014 Olivia Muesse. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var activityViewController: UIViewController!
    var feedViewController: UIViewController!
    var accountViewController: UIViewController!
    var composeViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        
        activityViewController = storyboard.instantiateViewControllerWithIdentifier("ActivityViewController") as UIViewController

        
        onHomeButton(self)
        
    }

    
    @IBAction func onHomeButton(sender: AnyObject) {
        println("a")
        homeViewController.view.frame = containerView.frame
        containerView.addSubview(homeViewController.view)
    }
    
    @IBAction func onSearchButton(sender: AnyObject) {
        println("b")
        searchViewController.view.frame = containerView.frame
        containerView.addSubview(searchViewController.view)
    }
    
    @IBAction func onComposeButton(sender: AnyObject) {
        performSegueWithIdentifier("composeSegue", sender: nil)
    }
    
    @IBAction func onAccountButton(sender: AnyObject) {
        println("c")
        accountViewController.view.frame = containerView.frame
        containerView.addSubview(accountViewController.view)
    }
    
    @IBAction func onActivityButton(sender: AnyObject) {
        println("d")
        activityViewController.view.frame = containerView.frame
        containerView.addSubview(activityViewController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
