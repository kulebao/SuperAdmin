//
//  ImageLoader.swift
//  SuperAdmin
//
//  Created by kpse on 10/24/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class ImageLoader {
    class func loadImage(url: String, target: UIImageView) {
        if url.isEmpty {
            return
        }
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let imageUrl = url
            var imageData =  UIImage(data: NSData(contentsOfURL: NSURL(string:url)!)!)
            dispatch_sync(dispatch_get_main_queue()!, {
                if url == imageUrl {
                    target.image = imageData
                    if target.superview != nil {
                        target.superview!.setNeedsLayout()
                        target.superview!.layoutIfNeeded()
                        
                    }
                }
            })
        })
    }
}