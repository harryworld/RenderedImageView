//
//  ViewController.swift
//  RenderedImageView
//
//  Created by Harry Ng on 28/8/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var viewA: NSView!
    @IBOutlet weak var viewB: NSView!
    
    var subview: CopyImageView?
    var upperView: SplitImageView?
    var bottomView: SplitImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let halfHeight = viewA.bounds.height / 2
        // bottom-left
        let upperFrame = viewA.bounds.with(height: halfHeight).with(y: halfHeight)
        let upperView = SplitImageView(frame: upperFrame)
        upperView.image = createSnapshot(with: upperFrame, at: viewA)
        self.upperView = upperView

        let bottomFrame = viewA.bounds.with(height: halfHeight)
        let bottomView = SplitImageView(frame: bottomFrame)
        bottomView.image = createSnapshot(with: bottomFrame, at: viewA)
        self.bottomView = bottomView

        let subview = CopyImageView(topHalf: upperView, bottomHalf: bottomView, originalPosition: CGPoint(x: 0, y: 0))
        viewB.addSubview(subview)
        self.subview = subview
        
        //subview.setAngleForHeight(20)
        //upperView.setAngle(70)
        //upperView.move(anchorPoint: CGPointMake(0.5, 0.0))
        bottomView.move(anchorPoint: CGPointMake(0.5, 1.0))
    }

    func createSnapshot(with frame: NSRect, at targetView: NSView) -> NSImage? {
        if let snapshot = targetView.bitmapImageRepForCachingDisplayInRect(frame) {
            targetView.cacheDisplayInRect(frame, toBitmapImageRep: snapshot)
            let img = NSImage(size: frame.size)
            img.addRepresentation(snapshot)
            return img
        }
        return nil
    }

    @IBAction func doSomething(sender: NSSlider) {
        //subview?.setAngleForHeight(CGFloat(sender.floatValue))
        upperView?.setAngle(CGFloat(sender.floatValue))
        bottomView?.setAngle(CGFloat(sender.floatValue))
    }
}
