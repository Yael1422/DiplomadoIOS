//: [Previous](@previous)

import Foundation

let someStrings: [String?] = ["This", "is", nil, "not", nil, "a", "drill", nil, "!"]

let concatenatedString = someStrings
    .filter { $0 != nil }
    .map { $0! }
    .reduce("", { $0 + $1 + " " })

print(concatenatedString)
