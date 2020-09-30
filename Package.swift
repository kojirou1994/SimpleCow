// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "SimpleCow",
  products: [
    .library(
      name: "SimpleCow",
      targets: ["SimpleCow"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "SimpleCow",
      dependencies: []),
    .testTarget(
      name: "SimpleCowTests",
      dependencies: ["SimpleCow"]),
  ]
)
