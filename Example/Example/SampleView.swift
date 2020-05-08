//
//  SampleView.swift
//  TableViewWIthHScrollExample
//
//  Created by Aleksandr Smetannikov on 30/04/2020.
//  Copyright © 2020 Alex Smetannikov. All rights reserved.
//

import UIKit
import HorizontalCardsView

class SampleView: HorizontalCardView {

    @IBOutlet weak var label: UILabel!

    func configure(with anyColor: Any, text: String) {
        self.backgroundColor = (anyColor as! UIColor)
        self.label.text = text
    }
}
