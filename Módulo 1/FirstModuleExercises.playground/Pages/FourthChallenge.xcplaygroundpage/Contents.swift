import Foundation

func login(_ password: String) -> Bool {
    // Min 6 characters
    if password.count < 6 {
        return false
    }
    
    // Contains a capital letter
    if password.rangeOfCharacter(from: .uppercaseLetters) == nil {
        return false
    }
    
    // Contain a number
    if password.rangeOfCharacter(from: .decimalDigits) == nil {
        return false
    }
    
    // Contain a point
    if !password.contains(".") {
        return false
    }
    
    return true
}

print(login("pass"))
print(login("Password1."))
