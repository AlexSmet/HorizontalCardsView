//
//  ViewController.swift
//  TableViewWIthHScrollExample
//
//  Created by Aleksandr Smetannikov on 14/04/2020.
//  Copyright © 2020 Alex Smetannikov. All rights reserved.
//

import UIKit
import HorizontalCollectionView

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: HorizontalCollectionView!

    let viewsSource = ViewsSource()
    
    override func viewDidLoad() {
        collectionView.viewsSource = viewsSource
        collectionView.cellSpacing = 15
        collectionView.inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

