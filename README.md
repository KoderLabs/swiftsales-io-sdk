# Swift-Chat iOS SDK

## Get Started

## Requirements
Swift-Chat iOS SDK requires iOS 13.3 or above, and is compatibile with Swift 5.

## Installation
### CocoaPods
Swift-Chat iOS SDK is available through [CocoaPods](http://cocoapods.org):

```ruby
pod 'swiftsales_ios_sdk'
```

### App Delegate
Initialize swift chat sdk by providing userId and domainName to SwiftSaleSdk.initialize method (***Note: you can get your userId and domainName from swiftSale admin panel)

```swift
import UIKit
import swiftsales_ios_sdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // initialize swift sale sdk
        SwiftSaleSdk.initialize(userId: 865, domainName:  "files.shahzaibsheikh.com")
        return true
    }

    ... // your remaining methods or code
}

```

## Usage

### For UI-Kit

You can manually open swiftsales chat from your view controller

```swift
import UIKit
import swiftsales_ios_sdk

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func OpenSwiftChatPressed(_ sender: UIButton) {
        SwiftSaleSdk.presentViewController(viewController: self) // or you can push SwiftSaleSdk.pushViewController(navigationController: self.navigationController)
    }
}
```

***SwiftSale SDK also provide UIView widget for UI-Kit name "SwiftChatFabView", you can add on your StoryBoard by selecting View from UI-Kit library and in identity inspector select SwiftChatFabView in custom class dropdown and also select swiftsales_ios_sdk from module dropdown.

### For Swift UI

You can manually open swiftsales chat from your content view by calling

``` swift
import SwiftUI
import swiftsales_ios_sdk

struct ContentView: View {
    @State private var showingChat = false
    
    var body: some View {
        VStack {
            Button("Open Swift Chat") {
               self.showingChat = true
            }
            .sheet(isPresented: $showingChat) {
                SwiftUiSwiftChatViewController()
            }
            // your layout
        }
    }
}
```

SwiftSale SDK also provide FAB for displaying and opening swiftchat sdk. just add SwiftUiSwiftChatFab() on your view
``` swift
import SwiftUI
import swiftsales_ios_sdk

struct ContentView: View {
    var body: some View {
        VStack {
            SwiftUiSwiftChatFab()
            // your layout
        }
    }
}

```


## License
```
MIT License

Copyright (c) 2020 Koderlabs

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
