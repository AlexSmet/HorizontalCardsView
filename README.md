[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat-square)](https://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat-square)
[![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat-square)](https://swift.org/about/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](http://opensource.org/licenses/MIT)

# HorizontalCardsView

Визуальный компонент для горизонтального скроллинга списка кастомных view.

Использование
---

1. Добавтье UIView в storyboard и установите `Custom Class` в `HorizontalCardsView`.
2. Добавте во `ViewController` реализацию протокола `HorizontalCardsViewSource` для предоставления view для отображения в списке и `HorizontalCardsViewDelegate` для обработки событий выбора view пользователем.
3. В методе `viewDidLoad()` у `UIViewController` нужно определить параметры `viewsSource`, `delegate` и такие параметры отображния как `cellSpacing` (расстояние между ячейками) и `inset` (отступы от краев)
```swift
class ViewController: UIViewController, HorizontalCardsViewSource, HorizontalCardsViewDelegate {

    @IBOutlet weak var horizontalCardsView: HorizontalCardsView!

    // ...
    
    override func viewDidLoad() {
        horizontalCardsView.viewsSource = self
        horizontalCardsView.delegate = self
        horizontalCardsView.cellSpacing = 15
        horizontalCardsView.inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // ...
    
    func horizontalCardsViewNumberOfItems(_ collectionView: HorizontalCardsView) -> Int {
        return 5
    }

    func horizontalCardsView(_: HorizontalCardsView, viewForIndex index: Int) -> HorizontalCardView {
        let bundle = Bundle(for: SampleView.self)
        let view = bundle.loadNibNamed("SampleView", owner: self, options: nil)?.first

        return view
    }
    
    func horizontalCardsView(_: HorizontalCardsView, didSelectItemAtIndex index: Int) {
        print("A view with index \(index) was selected.")
    }
    
    // ...
    
   }
   ```
4. View отображаемые в списке и возвращаемые методом `horizontalCardsView(_:viewForIndex:)` должны быть наследниками класса `HorizontalCardView`. Если нужно выполнить какие-то действия перед повторным использованием view, то можно переопределить метод `prepareForReuse()`. 
