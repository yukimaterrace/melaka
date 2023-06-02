// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppFeature",
    defaultLocalization: "ja",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "App", targets: ["App"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.7.1"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "App",
                dependencies: [
                    .target(name: "Domain"),
                    .target(name: "API"),
                    .product(name: "Swinject", package: "Swinject")
                ],
                resources: [
                    .copy("Resource/Font/Font Awesome 6 Brands-Regular-400.otf"),
                    .copy("Resource/Font/Font Awesome 6 Free-Regular-400.otf"),
                    .copy("Resource/Font/Font Awesome 6 Free-Solid-900.otf"),
                    .copy("Resource/Environment.plist")
                ]),

        .testTarget(name: "AppTests",
                    dependencies: [.target(name: "App")]),

        .target(name: "Domain", dependencies: []),

        .testTarget(name: "DomainTests",
                    dependencies: [.target(name: "Domain")]),

        .target(name: "API",
                dependencies: [
                    .product(name: "Alamofire", package: "Alamofire")
                ]),

        .testTarget(name: "APITests",
                    dependencies: [.target(name: "API")]),
        
        .target(name: "Mapper",
                dependencies: [
                    .target(name: "Domain"),
                    .target(name: "API")
                ]),
        
        .testTarget(name: "MapperTests",
                    dependencies: [.target(name: "Mapper")])
    ]
)
