//
//  HorizontalCardsView.swift
//  HorizontalCardsView
//
//  Created by Aleksandr Smetannikov on 27/04/2020.
//  Copyright © 2020 AlexSmetannikov. All rights reserved.
//

import UIKit

/// Источник view для отображения
public protocol HorizontalCardsDataSource {
    /// Возвращает число элементов
    func horizontalCardsViewNumberOfItems(_: HorizontalCardsView) -> Int
    /// Возвращает view для каждого индекса
    func horizontalCardsView(_: HorizontalCardsView, viewForIndex index: Int) -> HorizontalCardView
}

/// Делегат для обработки событий
public protocol HorizontalCardsDelegate {
    /// Выбор элемента в списке
    func horizontalCardsView(_: HorizontalCardsView, didSelectItemAtIndex index: Int)
}

/// Визуальный компонент реализующий список карточек (view) с горизонтальной прокруткой
/// Для правильного отбражения должен быть определен источник viewsSource
public class HorizontalCardsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    private let flowLayout = UICollectionViewFlowLayout()
    private var collectionView: UICollectionView!
    private let reuseIdentifier = "horizontalCardCell"

    private var indexOfCellBeforeDragging = 0

    /// Источник карточек (view) для отображния в коллекции
    public var dataSource: HorizontalCardsDataSource!

    /// Делегат для обработки событий
    public var delegate: HorizontalCardsDelegate?

    private var viewsCount: Int {
        return dataSource.horizontalCardsViewNumberOfItems(self)
    }

    private var cardSize: CGSize {
        get { return flowLayout.itemSize }
        set { flowLayout.itemSize = newValue }
    }

    public var cardWidthFactor: CGFloat = 0.8

    /// Расстояние между карточками
    public var cardSpacing: CGFloat {
        get { return flowLayout.minimumLineSpacing }
        set { flowLayout.minimumLineSpacing = newValue }
    }

    /// Отступы от границ
    public var insets: UIEdgeInsets {
        get { return flowLayout.sectionInset }
        set { flowLayout.sectionInset = newValue }
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initCollectionView()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        initCollectionView()
    }

    private func initCollectionView() {
        flowLayout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: bounds, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HorizontalCardCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        setCardSize()
    }

    ///  Обновление данных в коллекции
    public func reloadData() {
        setCardSize()
        collectionView.reloadData()
    }

    // Вычисление размеров карточки
    // Ширина:
    //     - единственная карточка занимает всю ширину компонента минус отстпы
    //     - при наличии нескольких карточек ширина вычисляется ширины компонента умноженная на cardWidthFactor
    // Высота вычисляется как высота компонента минус отступы
    private func setCardSize() {
        let singleCardWidth = bounds.width - insets.left - insets.right
        let multiCardsWidth = bounds.width * cardWidthFactor
        let cardWidth = viewsCount > 1 ? multiCardsWidth : singleCardWidth
        let cardHeght = collectionView.bounds.height - insets.top - insets.bottom
        cardSize = CGSize(width: cardWidth, height: cardHeght)
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewsCount
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HorizontalCardCell
        let view = dataSource.horizontalCardsView(self, viewForIndex: indexPath.row)
        cell.embedView(view)

        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.horizontalCardsView(self, didSelectItemAtIndex: indexPath.row)
    }
}

// MARK: - Центрирование на ячейке при скроллинге
extension HorizontalCardsView {

    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        indexOfCellBeforeDragging = getIndexOfMajorCell()
    }

    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        let cellIndexOffset = velocity.x == 0 ? 0 : (velocity.x > 0 ? 1: -1)
        let indexOfDestinationCell = max(0, min(viewsCount - 1, indexOfCellBeforeDragging + cellIndexOffset))
        let indexPath = IndexPath(row: indexOfDestinationCell, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    private func getIndexOfMajorCell() -> Int {
        let itemWidth = flowLayout.itemSize.width
        let proportionalOffset = flowLayout.collectionView!.contentOffset.x / itemWidth
        let index = Int(round(proportionalOffset))
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let safeIndex = max(0, min(numberOfItems - 1, index))
        return safeIndex
    }
}
