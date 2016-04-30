//
//  DetailViewController.swift
//  Wallpapers
//
//  Created by Mic Pringle on 07/01/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet var detailView: UIView!
  var paper: Paper?
  var origenFrame :CGRect?
  let transition = ReversePopAnimator()
    
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    if let paper = paper {
      navigationItem.title = paper.caption
      imageView.image = UIImage(named: paper.imageName)
      detailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DetailViewController.actionClose(_:))))

    }
  }
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    func actionClose(tap: UITapGestureRecognizer) {
       
        if let masterVC = storyboard!.instantiateViewControllerWithIdentifier("MasterViewController") as? MasterViewController {
            
            
            
            print(MasterViewController)
            
            masterVC.transitioningDelegate = self
            
            presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        }
        

        
        
       
    }
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }

}

extension DetailViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.originFrame = origenFrame!
        transition.presenting = false
        return transition
        
        
        
    }
    func animationControllerForPresentedController(
        presented: UIViewController,
        presentingController presenting: UIViewController,
                             sourceController source: UIViewController) ->
        UIViewControllerAnimatedTransitioning? {
            transition.originFrame = origenFrame!
            transition.presenting = true
            return transition
    }
    
}



