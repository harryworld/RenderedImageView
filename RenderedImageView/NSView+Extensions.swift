//
//  NSView+Extensions.swift
//  SortedMac
//
//  Created by Harry Ng on 30/7/2016.
//  Copyright © 2016 StaySorted Limited. All rights reserved.
//

import Cocoa

extension NSView {

    // ===================
    // MARK: - Anchorpoint
    // ===================

    func move(anchorPoint anchorPoint: CGPoint) {
        var newPoint = CGPointMake(bounds.size.width * anchorPoint.x, bounds.size.height * anchorPoint.y)
        var oldPoint = CGPointMake(bounds.size.width * layer!.anchorPoint.x, bounds.size.height * layer!.anchorPoint.y)

        newPoint = CGPointApplyAffineTransform(newPoint, layer!.affineTransform())
        oldPoint = CGPointApplyAffineTransform(oldPoint, layer!.affineTransform())

        var position = layer!.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer!.position = position
        layer!.anchorPoint = anchorPoint
    }

    var anchorPoint: CGPoint {
        return layer!.anchorPoint
    }

    // ==============================
    // MARK: - Being displayed or not
    // ==============================

    var isInSuperview: Bool {
        return superview != nil
    }

    // =============
    // MARK: - Angle
    // =============

    func setAngle(degrees: CGFloat) {
        let radians = degrees.degreesToRadians()
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0
        transform = CATransform3DRotate(transform, radians, 1, 0, 0)
        layer!.transform = transform
    }

    func setAngleWithInset(degrees: CGFloat) {
        let radians = degrees.degreesToRadians()
        let depth = abs(sin(radians) * bounds.height)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0
        transform = CATransform3DTranslate(transform, 0, 0, -depth)
        transform = CATransform3DRotate(transform, radians, 1, 0, 0)
        layer!.transform = transform
    }

}
