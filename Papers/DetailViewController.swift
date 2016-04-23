//
//  DetailViewController.swift
//  Wallpapers
//
//  Created by Mic Pringle on 07/01/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController ,UIViewControllerTransitioningDelegate{
  
  @IBOutlet weak var imageView: UIImageView!
  
    
    
  @IBOutlet var detailView: UIView!
  var paper: Paper?
  
  var origenFrame :CGRect?
    
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    if let paper = paper {
      navigationItem.title = paper.caption
      imageView.image = UIImage(named: paper.imageName)
      detailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DetailViewController.actionClose(_:))))

    }
  }
    
    func actionClose(tap: UITapGestureRecognizer) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
  
  
}
