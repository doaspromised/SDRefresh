//
//  UIScrollView + Extention.swift
//  Refresh
//
//  Created by 姜守栋 on 2018/4/18.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit

private var key: Void?

extension UIScrollView {
    
    var sd_header: UIView? {
        
        get {
            return objc_getAssociatedObject(self, &key) as? UIView
        }
        set {
            if sd_header != newValue {
                sd_header?.removeFromSuperview()
                objc_setAssociatedObject(self,
                                         &key,
                                         newValue,
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                self.addSubview(newValue!)
            }


        }
        
    }
    
    var sd_insetTop: CGFloat {
        get {
            return contentInset.top
        }
        set {
            contentInset.top = newValue
        }
    }
    
    var sd_insetBottom: CGFloat {
        get {
            return contentInset.bottom
        }
        set {
            contentInset.bottom = newValue
        }
    }
    
    var sd_insetLeft: CGFloat {
        get {
            return contentInset.left
        }
        set {
            contentInset.left = newValue
        }
    }

    var sd_insetRight: CGFloat {
        get {
            return contentInset.right
        }
        set {
            contentInset.right = newValue
        }
    }

    
    var sd_offsetX: CGFloat {
        get {
            return contentOffset.x
        }
        set {
            contentOffset.x = newValue
        }
    }

    var sd_offsetY: CGFloat {
        get {
            return contentOffset.y
            
        }
        set {
            contentOffset.y = newValue
        }
    }
    
    var sd_contentWidth: CGFloat {
        get {
            return contentSize.width
            
        }
        set {
            contentSize.width = newValue
        }
    }
    
    var sd_contentHeight: CGFloat {
        get {
            return contentSize.height
            
        }
        set {
            contentSize.height = newValue
        }
    }



}
