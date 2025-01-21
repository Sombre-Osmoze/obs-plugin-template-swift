// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "plugin-starter",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OBS",
            targets: ["OBS"]),
        .library(
            name: "plugin-starter",
            type: .dynamic,

            targets: ["plugin-starter"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // .systemLibrary(
        //     name: "OBS",
        //     pkgConfig: "obs",
        //     providers: [
        //         .apt(["libobs-dev"]),
        //         .brew(["obs"]),
        //     ]
        // ),
        .target(
            name: "OBS",
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ],
            linkerSettings: [.linkedLibrary("/usr/lib/libobs.so")]
            // cxxSettings: [.headerSearchPath("/usr/include/obs")]
        ),
        .target(
            name: "plugin-starter",
            dependencies: ["OBS"],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
                //                 .unsafeFlags(["-Xcc", "-L/usr/include/obs"]),
            ],
            linkerSettings: [
                .linkedLibrary("/usr/lib/libobs.so")
                //                                 .unsafeFlags(["-Wl"]),
            ]

        ),
        // .testTarget(
        //     name: "plugin-starterTests",
        //     dependencies: ["plugin-starter"]
        // ),
    ]
)
