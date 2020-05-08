//
//  ViewsSource.swift
//  Crowd
//
//  Created by Aleksandr Smetannikov on 28/04/2020.
//  Copyright © 2020 AlexSmetannikov. All rights reserved.
//

import UIKit
import HorizontalCardsView

class ViewsSource: NSObject, HorizontalCardsDataSource {

    let backgroundColors: [UIColor] = [
        UIColor(red: 156/255, green: 137/255, blue: 184/255, alpha: 1),
        UIColor(red: 240/255, green: 166/255, blue: 202/255, alpha: 1),
        UIColor(red: 239/255, green: 195/255, blue: 230/255, alpha: 1),
        UIColor(red: 184/255, green: 190/255, blue: 221/255, alpha: 1)]

    func horizontalCardsViewNumberOfItems(_ collectionView: HorizontalCardsView) -> Int {
        return backgroundColors.count
    }

    func horizontalCardsView(_: HorizontalCardsView, viewForIndex index: Int) -> HorizontalCardView {
                let bundle = Bundle(for: SampleView.self)
        let view = bundle.loadNibNamed("SampleView", owner: self, options: nil)?.first as! SampleView
        view.configure(with: backgroundColors[index], text: "SampleView #\(index+1)")

        return view
    }
}
