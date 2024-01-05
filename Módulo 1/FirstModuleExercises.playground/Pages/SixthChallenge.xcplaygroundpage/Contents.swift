import Foundation

func receiveBox(_ input: String?) {
    if let unwrappedInput = input {
        if unwrappedInput == "🐈" {
            print("Thanks for my cat Schrödinger!")
        } else {
            print("This ain't a cat!")
        }
    } else {
        print("It's empty! You ripped me off!")
    }
}

receiveBox("🐈")
// "Thanks for my cat Schrödinger!"
 
receiveBox(nil)
// "It's empty! You ripped me off!"

receiveBox("lol")
// "This ain't a cat!"
