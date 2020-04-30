//
//  PHorizontalCollectionEmbededView.swift
//  HorizontalCollectionView
//
//  Created by Aleksandr Smetannikov on 30/04/2020.
//  Copyright © 2020 Alex Smetannikov. All rights reserved.
//

import UIKit

public protocol PHorizontalCollectionEmbededView: UIView {
    func configure(with: Any)
    func prepareForReuse()
}
