//
//  Higher Order Functions in Swift
//  https://engineering.nodesagency.com/
//  By Kuldeep Singh on 13/07/2021.
//

/*
 
 Higher order functions in Swift are extremely powerful tools to have in your developer toolkit, the only issue is that it might take some time to get comfortable with them. Before we get started, let’s have a look at some important terms to know in relation with higher order functions:
 
 Collections - a sequence whose elements can be traversed multiple times, nondestructively, and accessed by an indexed subscript.
 
 Closures - self-contained blocks of functionality that can be passed around and used in your code.
 
 Shorthand arguments - Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.
 
 Optional - A type that represents either a wrapped value or nil, the absence of a value.
 
 */

import UIKit

/* Map
 Map is used when you want to apply the same operation to each element of a collection. It takes a single argument in the form of a mapping closure and returns an array with the transformed elements of the input sequence.
 
 Time complexity: O(n) - Linear - where n is the length of the sequence.
 */

// Example 1: Convert Meters to Feet
let meters = [10.0, 22.0, 55.0, 74.0]

let feet = meters.map { $0 * 3.281}
print("Meters converted to feet: \(feet)")

// -> Meters converted to feet: [32.81, 72.182, 180.455, 242.794]

// Example 2: Make the planet names capitalized
let planetNames = ["mars", "jupiter", "mercury", "saturn", "earth", "neptune", "uranus", "venus"]

let capitalizedPlanetNames = planetNames.map { $0.capitalized }
print("Planet names capitalized: \(capitalizedPlanetNames)")

// -> Planet names capitalized: ["Mars", "Jupiter", "Mercury", "Saturn", "Earth", "Neptune", "Uranus", "Venus"]


//Example 3: Map the array of addresses to an array of zipcodes
class Address {
    var street: String
    var zipcode: Int
    
    init(street: String, zipcode: Int) {
        self.street = street
        self.zipcode = zipcode
    }
}

var addresses = [Address]()
addresses.append(Address(street: "Nice Boulevard", zipcode: 1200))
addresses.append(Address(street: "Green Street", zipcode: 4560))

let zipcodes = addresses.map { $0.zipcode }
print("Zip codes: \(zipcodes)")

//-> Zip codes: [1200, 4560]






/*
 Filter
 Filter is used when you want to have a result with only elements that match a condition.
 
 Time complexity: O(n) - Linear - where n is the length of the sequence.
 */

// Example 1: Filter only the planets that start with the letter "M"
let filteredPlanetNames = planetNames.filter {$0.prefix(1).uppercased() == "M"}
print("Count of filtered planet names: \(filteredPlanetNames.count)")

//-> Count of filtered planet names: 2


// Example 2: Filter the address array to only addresses from zip code 1200
let filteredAddresses = addresses.filter {$0.zipcode == 1200}
print("Count of filtered addresses: \(filteredAddresses.count)")

//-> Count of filtered addresses: 1








/*
 Reduce
 Reduce is used when you want to combine all elements in a collection into one value.
 
 Time complexity: O(n) - Linear - where n is the length of the sequence.
 */

// Example 1: Sum of numbers - version 1
let numbers = [5, 3, 2, 6, 10, 23, 01, 43, 5, 7, 8, 9]

let sumOfNumbers = numbers.reduce(0, {$0 + $1})
print("Sum of numbers - version 1: \(sumOfNumbers)")

//-> Sum of numbers - version 1: 122

//The same can be written a bit shorter, like this:

// Example 2: Sum of numbers - version 2
let sumOfNumbers2 = numbers.reduce(0,+)
print("Sum of numbers - version 2: \(sumOfNumbers)")

//-> Sum of numbers - version 2: 122
// Example 3: Longest planet name
let longestPlanetName = planetNames.reduce("", {$0.count > $1.count ? $0 : $1 } )
print("Longest planet name: \(longestPlanetName)")

//-> Longest planet name: neptune






/*
 Sorted
 When calling sorted() on an array, it will return a new array that has the items sorted in ascending order. For this method to work, the elements in the array need to conform to the Comparable protocol.
 
 Time complexity: O(n log n) - where n is the length of the sequence.
 */

// Example 1: Sorting numbers ascending
let sortedNumbersAscending = numbers.sorted()
print("Sorted numbers ascending: \(sortedNumbersAscending)")

//-> Sorted numbers ascending: [1, 2, 3, 5, 5, 6, 7, 8, 9, 10, 23, 43]
//If you want the numbers sorted descending instead, you can use sorted like this as well:

//Example 2: Sorted numbers descending - version 1
let sortedNumbersDescending = numbers.sorted { (a, b) -> Bool in
    a > b
}
print("Sorted numbers descending - version 1: \(sortedNumbersDescending)")

//-> Sorted numbers descending - version 1: [43, 23, 10, 9, 8, 7, 6, 5, 5, 3, 2, 1]
//The same can be written a bit easier, like this:

//Example 3: Sorted numbers descending - version 2
let sortedNumbersDescending2 = numbers.sorted{($0 > $1)}
print("Sorted numbers descending - version 2: \(sortedNumbersDescending2)")

//-> Sorted numbers descending - version 2: [43, 23, 10, 9, 8, 7, 6, 5, 5, 3, 2, 1]
//Or like this:

//Example 4: Sorted numbers descending - version 3
let sortedNumbersDescending3 = numbers.sorted(by: >)
print("Sorted numbers descending - version 3: \(sortedNumbersDescending3)")

//-> Sorted numbers descending - version 3: [43, 23, 10, 9, 8, 7, 6, 5, 5, 3, 2, 1]





/*
 FlatMap
 If you look up flatMap in the Swift documentations you will find the following explanation: Returns an array containing the concatenated results of calling the given transformation with each element of this sequence. Basically flatMap flattens an array, containing more arrays with the same content type, into one “flat” array. If you’re using a flatMap on a “flat” array, it will split all items in that array (taken they’re of the same type), as the function flattens all subcollections into one single collection.
 
 Time complexity: O(m + n) - where n is the length of this sequence and m is the length of the result.
 
 */

// Example 1: Flatmap without optionals
let names = [["roxana", "peter", "jacob", "morten"],["iben", "nour", "nicolai"]]

let flatNames = names.flatMap({$0.sorted()})
print("Flatmap of names sorted: \(flatNames)")

//-> Flatmap of names sorted: ["jacob", "morten", "peter", "roxana", "iben", "nicolai", "nour"]
//Example 2: Flat Flatmap without optionals
let flatFlatNames = flatNames.flatMap({$0.sorted()})
print("Flat Flatmap of names sorted: \(flatFlatNames)")

//-> Flat Flatmap of names sorted: ["a", "b", "c", "j", "o", "e", "m", "n", "o", "r", "t", "e", "e", "p", "r", "t", "a", "a", "n", "o", "r", "x", "b", "e", "i", "n", "a", "c", "i", "i", "l", "n", "o", "n", "o", "r", "u"]
//Example 3: Flat with optionals
let scores = ["1", "2", "three", "four", "5"]

let flatMapNumbers: [Int?] = scores.flatMap { str in Int(str) }
print("Flatmap numbers: \(flatMapNumbers)")

//-> Flatmap numbers: [Optional(1), Optional(2), nil, nil, Optional(5)]


/* FlatMap is deprected: Use compactMap()*/





/*
 CompactMap
 CompactMap can be “used as flatMap”, when you work with optional values. CompactMap can be used to either give you nil-values (which flapMap can’t), but also to filter out nil-values from a sequence.
 
 Time complexity: O(m + n) - where n is the length of this sequence and m is the length of the result.
 */

// Example 1: Compact map with optionals
let compactMapped: [Int?] = scores.compactMap { str in Int(str) }
print("Compact map with optionals: \(compactMapped)")

//-> Compact map with optionals: [Optional(1), Optional(2), nil, nil, Optional(5)]
//Example 2: Compact map without optionals
let compactMapNumbers: [Int] = scores.compactMap { str in Int(str) }
print("Compact map without optionals: \(compactMapNumbers)")

//-> Compact map without optionals: [1, 2, 5]







/*
 Chaining
 Another great thing about higher order functions is that we can combine(chain) them. This means that what would normally have taken many lines of code can be reduced to a single line.
 */


// Example 1: An array of street names from a specific zipcode
let streetNamesFromZipcode = addresses.filter {$0.zipcode == 1200}.map {$0.street}
print("Street names from specific zipcode: \(streetNamesFromZipcode)")

//-> Street names from specific zipcode: ["Nice Boulevard"]
// Example 2: An array of sorted capitalized planet names
let sortedCapitalizedPlanetNames = planetNames.map { $0.capitalized }.sorted()
print("Sorted capitalized plane names: \(sortedCapitalizedPlanetNames)")

//-> Sorted capitalized plane names: ["Earth", "Jupiter", "Mars", "Mercury", "Neptune", "Saturn", "Uranus", "Venus"]
// Example 3: Names flat map sorted descending
let descendingFlatNames = names.flatMap({$0.sorted{$0 > $1}})
print("Descending sorted flat map names: \(descendingFlatNames)")

//-> Descending sorted flat map names: ["roxana", "peter", "morten", "jacob", "nour", "nicolai", "iben"]
