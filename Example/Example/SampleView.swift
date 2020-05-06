//
//  SampleView.swift
//  TableViewWIthHScrollExample
//
//  Created by Aleksandr Smetannikov on 30/04/2020.
//  Copyright © 2020 Alex Smetannikov. All rights reserved.
//

import UIKit
import HorizontalCollectionView

class SampleView: HorizontalCardView {

    func configure(with anyColor: Any) {
        self.backgroundColor = (anyColor as! UIColor)
    }
}
