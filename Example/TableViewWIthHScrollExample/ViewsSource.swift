//
//  ViewsSource.swift
//  Crowd
//
//  Created by Aleksandr Smetannikov on 28/04/2020.
//  Copyright © 2020 AlexSmetannikov. All rights reserved.
//

import UIKit
import HorizontalCollectionView

class ViewsSource: NSObject, PHorizontalCollectionViewsSource {

    let backgroundColors: [UIColor] = [.red, .blue, .green, .cyan, .magenta]

    var count: Int {
        return backgroundColors.count
    }

    func getView(index: Int) -> PHorizontalCollectionEmbededView {
        let bundle = Bundle(for: SampleView.self)
        let view = bundle.loadNibNamed("SampleView", owner: self, options: nil)?.first as! PHorizontalCollectionEmbededView
        view.configure(with: backgroundColors[index])

        return view
    }
}
