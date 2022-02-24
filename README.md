# 📝 What is ExtraLottie?

ExtraLottie is a SwiftUI wrapper of <a href="https://github.com/airbnb/lottie-ios">Lottie-iOS</a>.

# ℹ️ Info

Currently ExtraLottie supports custom loop mode, `LottieLoopMode`, starting animation from defined progress, looping animation with custom delay time.
# 🌐 Installation

Add package via SPM. 
1. Using Xcode 11 go to File > Swift Packages > Add Package Dependency
2. Paste the project URL: https://github.com/kingkej/ExtraLottie.git
3. Click on next and select the project target

# ⚙️ How to use

There are 3 available modes to start.
1. Simply providing animation name as parameter. In that case loop mode is set to `.loop`.
```swift
ExtraLottieView(animationName: "filename")
```
2. Providing animation name and `LottieLoopMode` (example: `.loop` or `.playOnce`)
```swift
ExtraLottieView(animationName: "filename", loopMode: .playOnce)
```
3. Providing animation name, `manualLoop` - set true to use custom delay, `delayBetweenLoop` - specifies time between loops (in seconds), `fromProgress` - specifies progress to start animation, set 0 to start from the beggining.
```swift
ExtraLottieView(animationName: "filename", manualLoop: true, delayBetweenLoop: 5.0, fromProgress: 0)
```

# ✅ Examples
This example makes animation view with loops. Delay between loops is 5 seconds.
```swift
import SwiftUI
import ExtraLottie

struct ContentView: View {
    var body: some View {
        ExtraLottieView(animationName: "64112-loading-bar-progress-bar", manualLoop: true, delayBetweenLoop: 5.0, fromProgress: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
