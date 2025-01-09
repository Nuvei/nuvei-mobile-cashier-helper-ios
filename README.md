Nuvei Cashier Helper SDK for iOS
==========================================

SETUP
------------
**CocoaPods:**  
Add the next source(s) in the top of the Podfile:
```Podfile
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Nuvei/nuvei-mobile-pods.git'
```

Add the next pods in under the relevant target(s) in the Podfile:
```Podfile
pod 'NuveiCashierHelper', '~> 3.4'
```

**Swift Package Manager:**

- Select *File* > *Add Package Dependency*
- In the Search bar, type https://github.com/Nuvei/nuvei-mobile-cashier-helper-ios
- Select the desired version
- Click *Add Package*
- Select the target in which to add the SDK
- Click *Add Package*

**Carthage integration:**  
Add the next pods in under the relevant target(s) in the Cartfile:
```Cartfile
github "Nuvei/nuvei-mobile-cashier-helper-ios" ~> 3.4
```

USAGE
------------
The SDK works with WKWebView, so add the next line before you load Nuvei cashier page in the web view (e.g. in viewDidLoad of the view controller that displays the web view):
```swift
override func viewDidLoad() {
  super.viewDidLoad()

  webView.navigationDelegate = self
  
  // Prepare the cashier URL
  let rawUrl = "<YOUR CASHIER URL WITHOUT '#' TAG IN THE END>"
  // CashierHelper.update will throw an exception if rawUrl already contains '#'
  let finalUrl = try? CashierHelper.update(url: rawUrl, with: [.qr, .card]) ?? cashierUrl
  
  // Setup web view and the rest of the view controller...
  
  webView.load(URLRequest(url: finalUrl))

  // Call this line after the webView is part of the view hierarchy
  CashierHelper.connect(to: webView, viewController: self)

  // You can add a locale argument to this func in case your app is not fully localizaed and you want to use a pre-defined locale in all the SDK screens (e.g. Credit Card Scanner)
  //CashierHelper.connect(to: webView, viewController: self, locale: "cs_CZ")
}
```

Implement the `WKNavigationDelegate` in your view controller:
```swift
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        do {
            if let url = navigationAction.request.url?.absoluteString, try NuveiCashierHelper.handleURL(url) {
                // Handled by NuveiCashierHelper, no need to do anything else, cancel the URL loading
                decisionHandler(.cancel)
            } else {
                // Not handled by NuveiCashierHelper, add your logic and/or complete the loading of the URL
                decisionHandler(.allow)
            }
        } catch {
            debugPrint(#function, "error = \(error)")
            decisionHandler(.allow)
        }
    }
}
```

LICENSE
------------
See: [LICENSE](https://github.com/Nuvei/nuvei-mobile-cashier-helper-ios/blob/master/LICENSE.md)
