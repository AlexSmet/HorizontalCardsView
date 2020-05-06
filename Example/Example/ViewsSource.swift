//
//  ViewsSource.swift
//  Crowd
//
//  Created by Aleksandr Smetannikov on 28/04/2020.
//  Copyright © 2020 AlexSmetannikov. All rights reserved.
//

import UIKit
import HorizontalCollectionView

class ViewsSource: NSObject, HorizontalCollectionViewsSource {

    let backgroundColors: [UIColor] = [.red, .blue, .green, .cyan, .magenta]

    func horizontalCollectionViewNumberOfItems(_ collectionView: HorizontalCollectionView) -> Int {
        return backgroundColors.count
    }

    func horizontalCollectionView(_ collectionView: HorizontalCollectionView, viewForIndex index: Int) -> HorizontalCollectionItemView {
                let bundle = Bundle(for: SampleView.self)
        let view = bundle.loadNibNamed("SampleView", owner: self, options: nil)?.first as! SampleView
        view.configure(with: backgroundColors[index])

        return view
    }
}
