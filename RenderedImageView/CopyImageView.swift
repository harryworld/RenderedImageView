//
//  CopyImageView.swift
//  RenderedImageView
//
//  Created by Harry Ng on 28/8/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class CopyImageView: NSView {

    var topHalf: SplitImageView!
    var bottomHalf: SplitImageView!

    convenience init(topHalf: SplitImageView, bottomHalf: SplitImageView, originalPosition: CGPoint) {
        self.init()

        self.topHalf = topHalf
        self.bottomHalf = bottomHalf

        frame = CGRectMake(0, 0, topHalf.bounds.width, topHalf.bounds.height + bottomHalf.bounds.height)

        addSubview(topHalf)
        addSubview(bottomHalf)
    }

    func setAngleForHeight(height: CGFloat) {
        let h = height //.clamped(0, bounds.height)
        //let percent = 1 - h / bounds.height
        let angle = acos(h / bounds.height).radiansToDegrees()
        topHalf.setAngleWithInset(-angle)
        bottomHalf.setAngleWithInset(angle)
        //topHalf.tintPercent(percent)
        //bottomHalf.tintPercent(percent)
    }
}
