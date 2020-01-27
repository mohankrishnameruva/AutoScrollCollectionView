# AutoScrollCollectionView

[![Version](https://img.shields.io/cocoapods/v/AutoScrollCollectionView.svg?style=flat)](https://cocoapods.org/pods/AutoScrollCollectionView)
[![License](https://img.shields.io/cocoapods/l/AutoScrollCollectionView.svg?style=flat)](https://cocoapods.org/pods/AutoScrollCollectionView)
[![Platform](https://img.shields.io/cocoapods/p/AutoScrollCollectionView.svg?style=flat)](https://cocoapods.org/pods/AutoScrollCollectionView)


## Example
Want to scroll your collectionView continuously after specific intervals?. You can use this class to get it done within seconds.
<span>
<img src="https://github.com/mohankrishnameruva/Assets/blob/master/HorizontalScroll.gif" width="400" height="900">
<img src="https://github.com/mohankrishnameruva/Assets/blob/master/VerticalScroll.gif" width="400" height="900">
</span> 



To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage
AutoScrollCollectionView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AutoScrollCollectionView'
```
And run `pod install` from your directory
 ```ruby
 pod install
 ```
 
In your storyboard subclass your collectionview from  "AutoScrollCollectionView"
Import the pod in your viewController "import AutoScrollCollectionView"
You can start scrolling of collectionView with the method `startAutoScrolling(withTimeInterval:)` which takes timeInterval parameter.
```swift
collectionView.startAutoScrolling(withTimeInterval: TimeInterval(exactly: 2.0)!)
```

## Author

mohanmeruva, mohanmeruva989@gmail.com

## License

AutoScrollCollectionView is available under the MIT license. See the LICENSE file for more info.
