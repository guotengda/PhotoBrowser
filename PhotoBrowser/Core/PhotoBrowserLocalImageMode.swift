//
//  PhotoBrowserLocalImageMode.swift
//  JXPhotoBrowser
//
//  Created by JiongXing on 2018/8/22.
//

import Foundation

public struct PhotoBrowserLocalImageMode: PhotoBrowserMode {
    
    var localImages: [UIImage]
    
    public init(localImages: [UIImage] = []) {
        self.localImages = localImages
    }
    
    public func numberOfItems() -> Int {
        return localImages.count
    }
    
    public func configure(cell: PhotoBrowserCell, at index: Int) {
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image = localImages[index]
    }
}
