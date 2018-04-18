//
//  RefreshHeader.swift
//  Refresh
//
//  Created by 姜守栋 on 2018/4/18.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit

class RefreshHeader: RefreshBaseView {
    
//    override var state: RefreshState {
//        
//        didSet {
//            
//        }
//    }
    
    static func header(with refreshingBlcok: @escaping refreshBlcok ) -> RefreshHeader {
        let header = self.init()
        header.refreshingBlock = refreshingBlcok
        return header
        
    }
    
    override func placeSubviews() {
        sd_x = 0.0
        sd_height = 64.0
        sd_width = (scrollView?.sd_width)!
        sd_y = -sd_height
    }
    
    override func scrollViewContentOffsetChanged(_ value: [NSKeyValueChangeKey : Any]?) {
        
    }
    
    
}
