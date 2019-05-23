import UIKit

let interestingNumbers = [
    "Prime": [1, 2, 3, 5, 7, 11, 13],
    "Fibb": [1, 1, 2, 3, 5, 8, 13, 21, 34],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0;
var largestOfLargest = 0;
var desiredName: String = ""

for (name, numbers) in interestingNumbers {
    for number in numbers {
        if largest < number {
            largest = number;
        }
    }
    if largestOfLargest < largest {
        largestOfLargest = largest
        desiredName = name
    }
}
print("Kind: ", desiredName, ", largest number: ", largestOfLargest)
