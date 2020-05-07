//
//  ViewController.swift
//  TableViewWIthHScrollExample
//
//  Created by Aleksandr Smetannikov on 14/04/2020.
//  Copyright © 2020 Alex Smetannikov. All rights reserved.
//

import UIKit
import HorizontalCardsView

class ViewController: UIViewController, HorizontalCardsViewDelegate {

    @IBOutlet weak var collectionView: HorizontalCardsView!

    let viewsSource = ViewsSource()
    
    override func viewDidLoad() {
        collectionView.viewsSource = viewsSource
        collectionView.delegate = self
        collectionView.cellSpacing = 15
        collectionView.inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func horizontalCardsView(_: HorizontalCardsView, didSelectItemAtIndex index: Int) {
        print("A view with index \(index) was selected.")
    }
}

