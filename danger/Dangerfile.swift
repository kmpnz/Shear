import Danger
import Foundation

let danger = Danger()

// SwiftLint.lint(.modifiedAndCreatedFiles(directory: "Sources"), inline: true)
SwiftLint.lint(inline: true, configFile: ".swiftlint.yml", strict: true)


