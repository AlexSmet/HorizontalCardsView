//
//  PHorizontalCollectionViewsSource.swift
//  HorizontalCollectionView
//
//  Created by Aleksandr Smetannikov on 27/04/2020.
//  Copyright © 2020 AlexSmetannikov. All rights reserved.
//

import UIKit

public protocol PHorizontalCollectionViewsSource {
    var count: Int { get }
    func getView(index: Int) -> PHorizontalCollectionEmbededView
}
