// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ogc-api-features-json-ios",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ogc-api-features-json-ios",
            targets: ["ogc-api-features-json-ios"]),
    ],
    dependencies: [
        .package(
            name: "simple-features-geojson-ios",
            url: "git@github.com:peroper/simple-features-geojson-ios.git",
            branch: "spm-support"
        )
    ],
    targets: [
        .binaryTarget(
            name: "ogc-api-features-json-ios",
            path: "XCFrameworks/ogc_api_features_json_ios.xcframework"
        )
    ]
)
