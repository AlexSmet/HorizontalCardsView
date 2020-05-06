//
//  HorizontalCollectionCell.swift
//  HorizontalCollectionView
//
//  Created by Aleksandr Smetannikov on 16/04/2020.
//  Copyright © 2020 AlexSmetannikov. All rights reserved.
//

import UIKit

class HorizontalCardCell: UICollectionViewCell {

    private (set) weak var embededView: UIView?

    func embedView(_ view: HorizontalCardView) {
        contentView.subviews.forEach { $0.removeFromSuperview() }
        contentView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true

        embededView = view
    }

    override func prepareForReuse() {
        (embededView as! HorizontalCardView).prepareForReuse()
    }
}
