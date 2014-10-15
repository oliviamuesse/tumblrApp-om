//
//  TabBarViewController.swift
//  tumblrApp-om
//
//  Created by Olivia Muesse on 10/12/14.
//  Copyright (c) 2014 Olivia Muesse. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var containerView: UIView!
    
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
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController") as UIViewController
        
        onHomeButton(self)
        
    }
    
    @IBAction func onHomeButton(sender: AnyObject) {
        println("a")
        homeViewController.view.frame = containerView.frame
        containerView.addSubview(homeViewController.view)
        self.addChildViewController(homeViewController)
        homeViewController.didMoveToParentViewController(self)
        composeViewController.view.removeFromSuperview()
        feedViewController.view.removeFromSuperview()
        accountViewController.view.removeFromSuperview()
        activityViewController.view.removeFromSuperview()
        searchViewController.view.removeFromSuperview()
        homeButton.selected = true
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
    }
    
    @IBAction func onSearchButton(sender: AnyObject) {
        println("b")
        searchViewController.view.frame = containerView.frame
        containerView.addSubview(searchViewController.view)
        self.addChildViewController(searchViewController)
        homeViewController.didMoveToParentViewController(self)
        composeViewController.view.removeFromSuperview()
        feedViewController.view.removeFromSuperview()
        accountViewController.view.removeFromSuperview()
        activityViewController.view.removeFromSuperview()
        homeButton.selected = false
        searchButton.selected = true
        accountButton.selected = false
        trendingButton.selected = false
    }
    
    @IBAction func onComposeButton(sender: AnyObject) {
//        performSegueWithIdentifier("ComposeSegue", sender: nil)
//        self.addChildViewController(composeViewController)
//        composeViewController.didMoveToParentViewController(self)
//        homeViewController.view.removeFromSuperview()
//        feedViewController.view.removeFromSuperview()
//        accountViewController.view.removeFromSuperview()
//        activityViewController.view.removeFromSuperview()
//        searchViewController.view.removeFromSuperview()
        
    }
    
    @IBAction func onAccountButton(sender: AnyObject) {
        println("c")
        accountViewController.view.frame = containerView.frame
        containerView.addSubview(accountViewController.view)
        self.addChildViewController(accountViewController)
        accountViewController.didMoveToParentViewController(self)
        homeViewController.view.removeFromSuperview()
        composeViewController.view.removeFromSuperview()
        feedViewController.view.removeFromSuperview()
        activityViewController.view.removeFromSuperview()
        searchViewController.view.removeFromSuperview()
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = true
        trendingButton.selected = false
    }
    
    @IBAction func onActivityButton(sender: AnyObject) {
        println("d")
        activityViewController.view.frame = containerView.frame
        containerView.addSubview(activityViewController.view)
        self.addChildViewController(activityViewController)
        activityViewController.didMoveToParentViewController(self)
        homeViewController.view.removeFromSuperview()
        composeViewController.view.removeFromSuperview()
        feedViewController.view.removeFromSuperview()
        accountViewController.view.removeFromSuperview()
        searchViewController.view.removeFromSuperview()
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(ComposeSegue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = ComposeSegue.destinationViewController as ComposeViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    //Animation: Custom segue
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
            isPresenting = true
            return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
            toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
            transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            }
        }
    }

}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


