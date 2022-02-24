// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExtraLottie",
    platforms: [
            .iOS(.v13)
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ExtraLottie",
            targets: ["ExtraLottie"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", .upToNextMajor(from: "3.3.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ExtraLottie",
            dependencies: ["Lottie"]),
        .testTarget(
            name: "ExtraLottieTests",
            dependencies: ["ExtraLottie"]),
    ]
)
