//
//  PhotoBrowserMode.swift
//  JXPhotoBrowser
//
//  Created by JiongXing on 2018/8/22.
//

import Foundation

public protocol PhotoBrowserMode {
    
    /// 捏合手势放大图片时的最大允许比例。默认2.0
    var imageMaximumZoomScale: CGFloat { get }
    
    /// 双击放大图片时的目标比例。默认2.0
    var imageZoomScaleForDoubleTap: CGFloat { get }
    
    /// 共有多少项
    func numberOfItems() -> Int
    
    /// 配置每一项的视图
    func configure(cell: PhotoBrowserCell, at index: Int)
}

//
// MARK: - 默认实现
//

extension PhotoBrowserMode {
    
    /// 捏合手势放大图片时的最大允许比例
    public var imageMaximumZoomScale: CGFloat {
        return 2.0
    }
    
    /// 双击放大图片时的目标比例
    public var imageZoomScaleForDoubleTap: CGFloat {
        return 2.0
    }
}
