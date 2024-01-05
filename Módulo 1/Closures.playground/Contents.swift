import Foundation

//closures
let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]
let volunteerAverages = [10.75, 4.2, 1.5, 12.12, 16.815]



//func isAscending(_ i: Int, _ j: Int) -> Bool {
//    return i < j
//}
//
//let volunteerSorted = volunteerCounts.sorted(by: isAscending)
//
//let volunteerSorted2 = volunteerCounts.sorted(by: {(i: Int, j: Int) -> Bool in
//    i < j
//})
//
//let volunteerSorted3 = volunteerCounts.sorted(by: {i, j in i < j } )
//let volunteerSorted4 = volunteerCounts.sorted(by: {$0 < $1 } )
//let volunteerSorted5 = volunteerCounts.sorted {$0 < $1 }
//
//print(volunteerSorted)
//print(volunteerSorted2)
//print(volunteerSorted3)
//print(volunteerSorted4)
//print(volunteerSorted5)



//func doAwsomeWork(on input: String,
//                  using transformer: () -> Void,
//                  then completion: () -> Void) {
//    //Here would go the logic to do the awesome work
//}
//
//doAwsomeWork(on: "Diplomado") {
//    //Here goes the transformer
//} then: {
//    //Here goes the completion
//}



//func format(numbers: [Double],
//using formatter: (Double) -> String = {"\($0)"}) -> [String] {
//    var result = [String]()
//
//    for number in numbers {
//        let transformedNumber = formatter(number)
//        result.append(transformedNumber)
//    }
//
//    return result
//}
//
//func rounder(_ number: Double) -> String {
//    let roundedNumber = Int(number)
//    return "\(roundedNumber)"
//}
//
//func addDescription(_ number: Double) -> String {
//    return "Volunteer Average \(number)"
//}
//
//let formatterAverageVolunteers = format(numbers: volunteerAverages,
//                                        using: rounder )
//print(formatterAverageVolunteers)
//
//let averageVolunteersDescription = format(numbers: volunteerAverages,
//                                          using: addDescription)
//print(averageVolunteersDescription)
//
//let defaultVolunteerFormat = format(numbers: volunteerAverages)
//print(defaultVolunteerFormat)



//MAP
let roundedVolunteers = volunteerAverages.map { number in
    return Int(number)
}
print(roundedVolunteers)


//FILTER
let passingVolunteers = roundedVolunteers.filter { number in
    return number >= 10
}
print(passingVolunteers)


//REDUCE
let totalVolunteers = passingVolunteers.reduce(0) { partialResult, number in
    return partialResult + number
}
print(totalVolunteers)

let finalVolunteerDescription = passingVolunteers.reduce("The volunteers were ") { partialResult, number in
    return partialResult + "\(number) "
}
print(finalVolunteerDescription)
