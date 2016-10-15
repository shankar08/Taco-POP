//
//  UICollectionView+Ext.swift
//  Taco POP
//
//  Created by Shankar Prajapati on 10/15/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView{
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else{
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
            
        }
        return cell
    }
}

extension UICollectionViewCell: ReusableView{}
