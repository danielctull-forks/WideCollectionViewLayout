//
//  Created by Pete Callaway on 08/01/2015.
//  Copyright (c) 2015 Dative Studios. All rights reserved.
//

import UIKit


class CustomLayout: UICollectionViewFlowLayout {
    
    
    var numberOfItemsPerRow: Int = 7 {
        didSet {
            invalidateLayout()
        }
    }
    
    
    override func prepareLayout() {
        super.prepareLayout()
        
        if let collectionView = self.collectionView {
            
            let width = collectionView.bounds.size.width
            
            var newItemSize = itemSize

            // Always use an item count of at least 1 and convert it to a float to use in size calculations
            let itemsPerRow = CGFloat(max(numberOfItemsPerRow, 1))
            
            // Calculate how wide items should be
            newItemSize.width = 44; newItemSize.height = 44;
            
            // Set the new item size
            itemSize = newItemSize
            
            var newInsets = sectionInset
            newInsets.left = (width - (itemsPerRow * newItemSize.width) - ((itemsPerRow-1) * minimumInteritemSpacing)) / 2
            newInsets.right = newInsets.left;
            sectionInset = newInsets
        }
    }
}
