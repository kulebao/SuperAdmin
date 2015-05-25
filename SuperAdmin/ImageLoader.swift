//
//  ImageLoader.swift
//  SuperAdmin
//
//  Created by kpse on 10/24/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

struct ImageLoader {
    static var cache: [String:UIImage] = [:]
    static func loadImage(url: String, target: UIImageView) {
        if url.isEmpty {
            return
        }
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let imageUrl = url
            if let imageData = ImageLoader.imageOfUrl(url) {
                self.cache[url] = imageData
                dispatch_sync(dispatch_get_main_queue()!, {
                    if url == imageUrl {
                        target.image = imageData
                        if target.superview != nil {
                            target.superview!.setNeedsLayout()
                            target.superview!.layoutIfNeeded()
                        }
                    }
                })
            }
        })
    }
    
    static func imageOfUrl(url: String) -> UIImage? {
        if let data = cache[url] {
            return data
        } else {
            if let contentUrl = NSURL(string:url) {
                return UIImage(data: NSData(contentsOfURL: contentUrl)!)
            } else {
                return nil
            }
        }
    }
}