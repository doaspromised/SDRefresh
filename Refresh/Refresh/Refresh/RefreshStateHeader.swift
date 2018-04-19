//
//  RefreshStateHeader.swift
//  Refresh
//
//  Created by 姜守栋 on 2018/4/19.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit

class RefreshStateHeader: RefreshHeader {
    
    lazy var descriptionLable: UILabel = {
       
        let descriptionLable = UILabel.sd_lable()
        return descriptionLable
        
    }()
    lazy var lastUpdateTimeLable: UILabel = {
        let lastUpdateTimeLable = UILabel.sd_lable()
        return lastUpdateTimeLable
    }()
    
    override var state: RefreshState {
        didSet {
            super.state = state
            
            if state == .refreshing {
                descriptionLable.text = "正在刷新..."
                lastUpdateTimeLable.text = "2018-4-19 15:42(fake time)"
            } else if state == .pulling {
                descriptionLable.text = "松手立刻刷新..."
                lastUpdateTimeLable.text = "2018-4-19 15:42(fake time)"
            } else {
                descriptionLable.text = "下拉进行刷新..."
                lastUpdateTimeLable.text = "2018-4-19 15:42(fake time)"
            }
        }
    }
    override func prepare() {
        super.prepare()
        addSubview(descriptionLable)
        addSubview(lastUpdateTimeLable)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        
        descriptionLable.frame = CGRect(x: 0, y: 0, width: self.sd_width, height: self.sd_height / 2.0)
        
        lastUpdateTimeLable.frame = CGRect(x: 0, y: descriptionLable.sd_height, width: self.sd_width, height: self.sd_height / 2.0)
        
    }
    
}
