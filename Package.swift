// swift-tools-version: 6.0
//
// Norikae のフロントエンド共通パッケージを、Swift Playgrounds から読み込めるように切り出したもの。
// テストとテスト専用の依存は含めない。

import PackageDescription

let package = Package(
    name: "NorikaeKit",
    defaultLocalization: "ja",
    platforms: [.iOS(.v18), .watchOS(.v11)],
    products: [
        .library(name: "Domain", targets: ["Domain"]),
        .library(name: "NorikaeData", targets: ["NorikaeData"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "LiveGuidance", targets: ["LiveGuidance"]),
        .library(name: "Feature", targets: ["Feature"]),
    ],
    targets: [
        .target(name: "Domain"),
        .target(
            name: "NorikaeData",
            dependencies: ["Domain"],
            resources: [.process("Resources")]
        ),
        .target(
            name: "DesignSystem",
            dependencies: ["Domain"],
            resources: [.process("Resources")]
        ),
        .target(
            name: "LiveGuidance",
            dependencies: ["Domain", "DesignSystem"],
            resources: [.process("Resources")]
        ),
        .target(
            name: "Feature",
            dependencies: ["Domain", "NorikaeData", "DesignSystem", "LiveGuidance"],
            resources: [.process("Resources")]
        ),
    ],
    swiftLanguageModes: [.v6]
)
