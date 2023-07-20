// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Aquarium",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .executable(name: "Aquarium", targets: ["Aquarium"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.4"),
    ],
    targets: [
        .executableTarget(
            name: "Aquarium",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                "Aquarium.Models",
                "Aquarium.Controllers",
                "Aquarium.Views"
            ],
            path: "Sources/Aquarium",
            source: ["Main.swift"]
        ),
        .target(
            name: "Aquarium.Models",
            dependencies: [],
            path: "Sources/Aquarium/Models"
        ),
        .target(
            name: "Aquarium.Controllers",
            dependencies: ["Aquarium.Models"],
            path: "Sources/Aquarium/Controllers"
        ),
        .target(
            name: "Aquarium.Views",
            dependencies: ["Aquarium.Models"],
            path: "Sources/Aquarium/Views"
        ),
        .testTarget(
            name: "AquariumTests",
            dependencies: ["Aquarium"]
        )
    ]
)
