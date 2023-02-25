// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SyntaxAnalyzer",
	platforms: [.macOS(.v10_15)],
    products: [
		.executable(name: "SyntaxAnalyzer", targets: ["SyntaxAnalyzer"]),
    ],
	dependencies: [
		.package(url: "https://github.com/apple/swift-syntax.git", branch: "main"),
		.package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
	],
    targets: [
		.executableTarget(
			name: "SyntaxAnalyzer",
			dependencies: [
				.product(name: "SwiftSyntax", package: "swift-syntax"),
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
			],
			path: "Sources"),
        .testTarget(
            name: "SyntaxAnalyzerTests",
			dependencies: ["SyntaxAnalyzer"],
			path: "Tests"),
    ]
)
