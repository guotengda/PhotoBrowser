//
//  PhotoBrowserAnimationType.swift
//  JXPhotoBrowser
//
//  Created by JiongXing on 2018/8/22.
//

import Foundation

public enum PhotoBrowserAnimationType {
    /// 透明渐变
    case fade
    /// 缩放
    case scale(relatedViewAndHidden: ((_ index: Int) -> (UIView?, Bool)))
}
