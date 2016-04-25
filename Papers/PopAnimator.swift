/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  let duration    = 8.0
  var presenting  = true
  var originFrame = CGRect.zero
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)-> NSTimeInterval {
    return duration
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

    let containerView = transitionContext.containerView()!
    let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
    let detalle = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! DetailViewController
    
    let detailView = presenting ? toView : transitionContext.viewForKey(UITransitionContextFromViewKey)!
    
    let initialFrame = presenting ? originFrame : detailView.frame
    let finalFrame = presenting ? detailView.frame : originFrame
    
    let xScaleFactor = presenting ?
      initialFrame.width / finalFrame.width :
      finalFrame.width / initialFrame.width
    
    let yScaleFactor = presenting ?
      initialFrame.height / finalFrame.height :
      finalFrame.height / initialFrame.height
    
    let scaleTransform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor)
    
    if presenting {
      detailView.transform = scaleTransform
      detailView.center = CGPoint(
        x: CGRectGetMidX(initialFrame),
        y: CGRectGetMidY(initialFrame))
      detailView.clipsToBounds = true
    }
    
    containerView.addSubview(toView)
    containerView.bringSubviewToFront(detailView)
    
    UIView.animateWithDuration(duration/2, delay:0.0,
      usingSpringWithDamping: 0.4,
      initialSpringVelocity: 0.0,
      options: [],
      animations: {
        detailView.transform = self.presenting ?
          CGAffineTransformIdentity : scaleTransform
        
        detailView.center = CGPoint(x: CGRectGetMidX(finalFrame),
          y: CGRectGetMidY(finalFrame))
        
      }, completion:{_ in
       transitionContext.completeTransition(true)
    })
    
    UIView.animateWithDuration(duration/2, delay: duration/2,
                               usingSpringWithDamping: 0.4,
                               initialSpringVelocity: 0.0,
                               options: [],
                               animations: {
                    detalle.botonConstraint.constant = 100
                    detalle.alturaimagen.constant = detalle.alturaimagen.constant - 100
                    [detalle .updateViewConstraints()]
                                
        }, completion:{_ in
            
    })
    
//    let round = CABasicAnimation(keyPath: "cornerRadius")
//    round.fromValue = presenting ? 20.0/xScaleFactor : 0.0
//    round.toValue = presenting ? 0.0 : 20.0/xScaleFactor
//    round.duration = duration / 2
//    detailView.layer.addAnimation(round, forKey: nil)
//    detailView.layer.cornerRadius = presenting ? 0.0 : 20.0/xScaleFactor
  }
  
}
