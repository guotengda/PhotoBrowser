//
//  PhotoBrowserMode.swift
//  JXPhotoBrowser
//
//  Created by JiongXing on 2018/8/22.
//

import Foundation

public protocol PhotoBrowserMode {
    
    /// 共有多少项
    func numberOfItems() -> Int
    
    /// Cell重用时调用
    func reuse(cell: PhotoBrowserCell, at index: Int)
}

//
// MARK: - 默认实现
//

extension PhotoBrowserMode {
    
}
