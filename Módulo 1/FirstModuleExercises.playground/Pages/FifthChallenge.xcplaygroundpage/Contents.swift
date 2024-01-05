import Foundation

func optionals(string: String?) {
    if let unwrappedString = string {
        print(unwrappedString)
    } else {
        print("empty value")
    }
}

// Example usage:
let testString: String? = "Hello world"
optionals(string: testString)

let anotherString: String? = nil
optionals(string: anotherString)
