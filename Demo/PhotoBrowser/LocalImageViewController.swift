//
//  LocalImageViewController.swift
//  PhotoBrowser
//
//  Created by JiongXing on 2018/8/12.
//  Copyright © 2018年 JiongXing. All rights reserved.
//

import UIKit
import JXPhotoBrowser

final class LocalImageViewController: BaseCollectionViewController {
    
    override var name: String {
        return "本地图片"
    }
    
    override var switchTitle: String?  {
        return  "动画:"
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
        cell.imageView.image = self.dataSource[indexPath.item].localName.flatMap({ name -> UIImage? in
            return UIImage(named: name)
        })
        return cell
    }
    
    override func openPhotoBrowser(with collectionView: UICollectionView, indexPath: IndexPath) {
        // 创建浏览模式
        let mode = PhotoBrowserLocalMode(numberOfItems: {
            // 共有多少项
            return self.dataSource.count
        }, imageAtIndex: { (index) -> UIImage? in
            // 每一项的图片对象
            return self.dataSource[index].localName.flatMap({ name -> UIImage? in
                return UIImage(named: name)
            })
        })
        // 创建图片浏览器
        let browser = PhotoBrowser(mode: mode)
        // 使用缩放型动画
        if isSWitchOn {
            browser.animationType = .zoom(originViewIsHidden: { index -> (UIView?, Bool) in
                let view = collectionView.cellForItem(at: indexPath)
                return (view, true)
            })
        }
        // 显示
        browser.show(originIndex: indexPath.item, from: self)
    }

}
