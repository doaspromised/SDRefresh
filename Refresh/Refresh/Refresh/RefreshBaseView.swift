//
//  RefreshBaseView.swift
//  Refresh
//
//  Created by 姜守栋 on 2018/4/18.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit

typealias refreshBlcok = (()->Void)
/// 刷新状态
enum RefreshState: Int {
    
    case idle, pulling, refreshing
    
}

class RefreshBaseView: UIView {
    
    /// 传递进来的block
    var refreshingBlock: refreshBlcok?
    /// 当前的刷新状态， 默认idle
    var state: RefreshState = .idle
    /// 下拉刷新视图被加载到的视图
    var scrollView: UIScrollView?
    
    public func prepare() {
        backgroundColor = .red
    }
    
    public func placeSubviews() {
        
    }
    
    public func endRefreshing() {
        
    }
    
    func scrollViewContentOffsetChanged(_ value: [NSKeyValueChangeKey : Any]?) {
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        placeSubviews()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        superview?.removeObserver(self, forKeyPath: "contentOffset")
        
        if (newSuperview != nil) && newSuperview is UIScrollView {
            scrollView = (newSuperview as! UIScrollView)
            scrollView?.addObserver(self,
                                    forKeyPath: "contentOffset",
                                    options: .new,
                                    context: nil)
        }
        setNeedsLayout()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath! == "contentOffset" {
            scrollViewContentOffsetChanged(change)
        }
    }
    
}

extension UILabel {
    
    static func sd_lable() -> UILabel {
        
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 14.0)
        lable.backgroundColor = .clear
        lable.textColor = .blue
        lable.autoresizingMask = .flexibleWidth
        lable.textAlignment = .center
        return lable
    }
    
    func textWidth() -> CGFloat {
        
        if let textSize = text?.size(withAttributes: [NSAttributedStringKey.font: font]) {
            return textSize.width
        }
        
        return 0.0
    }
}
