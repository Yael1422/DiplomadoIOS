import Foundation

var cellphone: String = "5570742196"
var landline: String? = nil

print(cellphone)
print(landline ?? "No tengo telefono de casa")
//print(landline!)

if let landline2 = landline {
    print(landline2)
}

guard let landline2 = landline else {
    fatalError("Oops")
}
