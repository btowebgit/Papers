//
//  PresentAnimator.swift
//  BeginnerCook
//
//  Created by Julian Bruno on 2/20/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit


class PresentAnimator : NSObject ,UIViewControllerAnimatedTransitioning {
//    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
//    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
//    public func animateTransition(transitionContext: UIViewControllerContextTransitioning)
//    
//    // This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
//    optional public func animationEnded(transitionCompleted: Bool)
    
    let duration = 3.0
    
    var originFrame =  CGRect.zero
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView  = transitionContext.containerView()!
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let toControllerView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)! as! DetailViewController
        
        
        originFrame = toControllerView.origenFrame!
        
        //create animation
        
        
        let finalFrame = toView.frame
        
        let xScaleFactor = originFrame.width / finalFrame.width
        let yScaleFactor = originFrame.height / finalFrame.height
        let scaleTransform = CGAffineTransformMakeScale(xScaleFactor,yScaleFactor)
        
        
        toView.transform = scaleTransform
        toView.center = CGPoint(x: CGRectGetMidX(self.originFrame), y: CGRectGetMidY(self.originFrame));
        toView.clipsToBounds = true
        
        containerView.addSubview(toView)
        
//        let round = CABasicAnimation(keyPath: "cornerRadius")
//        round.fromValue = 20.0/xScaleFactor
//        round.toValue = 0.0
//        round.duration = duration / 2
//        toView.layer.addAnimation(round, forKey: nil)
//        
        
        let herbController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! DetailViewController
        herbController.detailView.alpha = 1
        
            UIView.animateWithDuration(duration/2, delay: 0.0,
                    usingSpringWithDamping: 0.5, initialSpringVelocity: 0,
                    options: [], animations: {
                        
                        toView.transform = CGAffineTransformIdentity
                        toView.center =  CGPoint(x: CGRectGetMidX(finalFrame), y: CGRectGetMidY(finalFrame));
                       
                       // herbController.detailView.alpha = 1

            }, completion: {_ in
                    transitionContext.completeTransition(
                    !transitionContext.transitionWasCancelled()
                                    )
                print ("Transition completed")

            })
    
    
        
        
    }
}
