//
//  ViewsSource.swift
//  Crowd
//
//  Created by Aleksandr Smetannikov on 28/04/2020.
//  Copyright © 2020 AlexSmetannikov. All rights reserved.
//

import UIKit
import HorizontalCardsScroller

class ViewsSource: NSObject, HorizontalCardsSource {

    let backgroundColors: [UIColor] = [.red, .blue, .green, .cyan, .magenta]

    func horizontalCardsScrollerNumberOfItems(_ collectionView: HorizontalCardsScroller) -> Int {
        return backgroundColors.count
    }

    func horizontalCardsScroller(_ collectionView: HorizontalCardsScroller, viewForIndex index: Int) -> HorizontalCardView {
                let bundle = Bundle(for: SampleView.self)
        let view = bundle.loadNibNamed("SampleView", owner: self, options: nil)?.first as! SampleView
        view.configure(with: backgroundColors[index])

        return view
    }
}
