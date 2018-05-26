// swift-tools-version:4.0
// Generated automatically by Perfect Assistant 2
// Date: 2018-04-19 08:41:45 +0000
import PackageDescription

let package = Package(
	name: "helloworld",
	dependencies: [
		.package(url: "https://github.com/vapor/vapor.git", "3.0.0-rc"..<"4.0.0"),
		.package(url: "https://github.com/vapor/fluent-sqlite.git", "3.0.0-rc"..<"4.0.0"),
		.package(url: "https://github.com/vapor/leaf.git", "3.0.0-rc"..<"4.0.0"),
		.package(url: "https://github.com/LiveUI/XMLCoding/", "0.1.0"..<"1.0.0")
	],
	targets: [
		.target(name: "App", dependencies: ["FluentSQLite", "Vapor", "Leaf", "XMLCoding"]),
		.target(name: "Run", dependencies: ["App"]),
		.testTarget(name: "AppTests", dependencies: ["App"])
	]
)
