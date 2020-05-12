[![Cocoapods](https://img.shields.io/cocoapods/v/HorizontalCardsView.svg?style=flat-square)](https://cocoapods.org/pods/HorizontalCardsView)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat-square)](https://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat-square)
[![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat-square)](https://swift.org/about/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](http://opensource.org/licenses/MIT)

# HorizontalCardsView

Visual component realizes a horizontally scrollable list of cards.

![Scrolling example](https://user-images.githubusercontent.com/25868364/81389144-078fc680-9122-11ea-9857-e736c0483db2.gif)

Installation
---

### CocoaPods
[CocoaPods](https://cocoapods.org) is the preffered way to add HorizontalCardsView to your project.

Just add following line to your Podfile
```
pod 'HorizontalCardsView'
```
Then run a `pod install` inside your terminal.

After that you can include HorizontalCardsView wherever you need it with 
```
import HorizontalCardsView
```

Usage
---

1. Add `UIView` to storyboard and set `Custom Class` as `HorizontalCardsView`.
  
![Storyboard](https://user-images.githubusercontent.com/25868364/81420128-24df8780-9158-11ea-9c88-860a21c16d2e.png)
  
2. Set you `ViewController` to conform `HorizontalCardsDataSource` and `HorizontalCardsDelegate`protocols.
3. Setup params `viewsSource` and `delegate` in `viewDidLoad()` for your `HorizontalCardsView` instance.
Also, you should define params `cardSpasing` and `insets`.  Height of cards is calculated as the height of `HorizontalCardsView` minus top and bottom insets. WIdth of cards is calculated as the width of `HorizontalCardsView` with `cardWidthFactor` or width of `HorizontalCardsView` minus left and right insets if the component contains a single card.
```swift
class ViewController: UIViewController, HorizontalCardsDataSource, HorizontalCardsDelegate {

    @IBOutlet weak var horizontalCardsView: HorizontalCardsView!

    // ...
    
    override func viewDidLoad() {
        horizontalCardsView.dataSource = self
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
4. Views which you want to display in the scrollable list must be descendants of `HorizontalCardView` class. Override `prepareForReuse()` method, if you want to do some actions before views will be reused.
