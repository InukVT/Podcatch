// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "helloworld",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0-rc"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0-rc"),
		
		// 🖥 XML Parser for getting podcast
		.package(url: "https://github.com/drmohundro/SWXMLHash", from: "4.0.0"),
		.package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0"),
		
		// 🖥 HTML Generator known as leaf.branch("beta")
		.package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc"),
    ],
    targets: [
        .target(name: "App", dependencies: [
			"FluentSQLite",
			"Vapor",
			"SWXMLHash",
			"Alamofire",
			"Leaf"
		]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)

