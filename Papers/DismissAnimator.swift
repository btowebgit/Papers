//
//  DismissAnimator.swift
//  BeginnerCook
//
//  Created by Marin Todorov on 11/13/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
  let duration = 4.0
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return duration
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
    //1) setup the transition
    let containerView = transitionContext.containerView()!
    
    let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
    let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
    
    let fromControllerView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as! DetailViewController
    
    
    //containerView.insertSubview(toView, belowSubview: fromView)
    let finalFrame = fromControllerView.origenFrame!
    
    
    
    var originFrame = fromControllerView.imageView.convertRect(fromControllerView.imageView.frame, toView: nil)
    
//    let initialFrame = fromView.frame
//    let xScaleFactor = originFrame.width / initialFrame.width
//    let yScaleFactor = originFrame.height / initialFrame.height
//    let scaleTransform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor)
//
    
    
    
    //2) animations!
    toView.alpha = 0.0
    
    //containerView.addSubview(toView)
    
    
    
    
    let nuevaVista = UIView(frame: originFrame);
    
    nuevaVista.backgroundColor = UIColor.purpleColor()
    nuevaVista.alpha = 0.5
    containerView.addSubview(nuevaVista)
    
    
    
    
    UIView.animateWithDuration(0.1, delay: 0,
        options: [], animations: {
            
            fromView.frame = originFrame
            fromView.center = CGPoint(
                x: CGRectGetMidX(originFrame),
                y: CGRectGetMidY(originFrame)
            )
            
            
            
        }, completion: {_ in
            
            
    })

    
    UIView.animateWithDuration(duration-0.1, delay: 0.1,
      options: [], animations: {
        
        toView.alpha = 1.0
        fromView.alpha = 0.0
        
        }, completion: {_ in
        //3) complete the transition
            transitionContext.completeTransition(
          !transitionContext.transitionWasCancelled()
        )
        
        
    })
    
    //fromView.removeFromSuperview()
    
    
  }
  
}
