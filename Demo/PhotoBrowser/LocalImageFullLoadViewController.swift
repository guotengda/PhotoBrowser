//
//  LocalImageFullLoadViewController.swift
//  PhotoBrowser
//
//  Created by JiongXing on 2018/8/12.
//  Copyright © 2018年 JiongXing. All rights reserved.
//

import UIKit
import JXPhotoBrowser

final class LocalImageFullLoadViewController: BaseCollectionViewController {
    
    override var switchTitle: String?  {
        return  "动画:"
    }
    
    override var name: String {
        return "本地图片-全量加载"
    }
    
    override func makeDataSource() -> [PhotoModel] {
        var result: [PhotoModel] = []
        (0..<6).forEach {
            let model = PhotoModel(thumbnailUrl: nil, highQualityUrl: nil, rawUrl: nil, localName: "local_\($0)")
            result.append(model)
        }
        return result
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusedId, for: indexPath) as! BaseCollectionViewCell
        if let imageName = dataSource[indexPath.item].localName {
            cell.imageView.image = UIImage(named: imageName)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        // 获取全量图片
        let images = dataSource.map { (model) -> UIImage in
            var image: UIImage?
            if let name = model.localName {
                image = UIImage(named: name)
            }
            return image ?? UIImage()
        }
        // 创建图片浏览器
        let browser = PhotoBrowser(originPageIndex: indexPath.item)
        browser.browserMode = PhotoBrowserLocalImageMode(localImages: images)
        if isSWitchOn {
            // 使用缩放型动画
            browser.animationType = .scale(relatedViewAndHidden: { index -> (UIView?, Bool) in
                let view = collectionView.cellForItem(at: IndexPath(item: index, section: 0))
                return (view, true)
            })
        }
        // 显示
        browser.show(from: self)
    }
}
