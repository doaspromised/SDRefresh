//
//  RefreshNormalHeader.swift
//  Refresh
//
//  Created by 姜守栋 on 2018/4/19.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit

class RefreshNormalHeader: RefreshStateHeader {

    /// 箭头
    lazy var arrowImageView: UIImageView = {
       
        let imageView = UIImageView()
        if let mjBundlePath = Bundle.main.path(forResource: "MJRefresh", ofType: "bundle"),
            let imagePath = Bundle(path: mjBundlePath)?.path(forResource: "arrow@2x", ofType: "png"),
            let image = UIImage(contentsOfFile: imagePath)
        {
            imageView.image = image
            
        }
        return imageView
    }()
    
    /// 加载状态视图
    lazy var loadView: UIActivityIndicatorView = {
       
        let loadView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        loadView.tintColor = descriptionLable.textColor
        
        return loadView
        
    }()
    
    override func prepare() {
        super.prepare()
        
        addSubview(arrowImageView)
        addSubview(loadView)
        loadView.isHidden = true
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        
        let descLableWidth = descriptionLable.textWidth()
        let timeLableWidth = lastUpdateTimeLable.textWidth()
        let actualWidth = descLableWidth > timeLableWidth ? descLableWidth : timeLableWidth
        
        print(descLableWidth, timeLableWidth, sd_height)
        arrowImageView.center = CGPoint(x: (sd_width - actualWidth)/4.0, y: sd_height / 2.0)
        arrowImageView.sd_size = arrowImageView.image?.size ?? CGSize.zero
        
        loadView.center = arrowImageView.center
        loadView.sd_size = arrowImageView.sd_size
        
        
    }
    
    override var state: RefreshState {
        didSet {
            super.state = state
            switch state {
            case .idle:
                loadView.stopAnimating()
                UIView.animate(withDuration: 0.3, animations: {
                    self.arrowImageView.transform = CGAffineTransform.identity
                }, completion: { (finished) in
                    
                    self.loadView.isHidden = true
                    self.arrowImageView.isHidden = false
                })
            case .pulling:
                UIView.animate(withDuration: 0.3, animations: {
                    self.arrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat(0.0001 - Double.pi))
                }, completion: { (finished) in
                    self.loadView.isHidden = true
                    self.arrowImageView.isHidden = false
                })
            case .refreshing:
                loadView.startAnimating()
                loadView.isHidden = false
                arrowImageView.isHidden = true
            }
        }
    }
}
