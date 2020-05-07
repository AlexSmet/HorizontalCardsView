//
//  HorizontalCardView.swift
//  HorizontalCardsView
//
//  Created by Aleksandr Smetannikov on 30/04/2020.
//  Copyright © 2020 Alex Smetannikov. All rights reserved.
//

import UIKit

/// Класс от которого должны наследоваться все view используемые в коллекции
open class HorizontalCardView: UIView {
    /// Преопределите этот метод, если требуется выполнить специальные дествия перед повторным использованием
    open func prepareForReuse() { }
}
