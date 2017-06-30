//: Playground - noun: a place where people can play

import UIKit

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 18, 71, 12, 13]
hasAnyMatches(list: numbers, condition: lessThanTen)

print(numbers)

numbers.map({ (number: Int) -> Int in
    if number % 2 != 0 {
        return 0
    }
    return number
})


let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)


let sortedNumbers = numbers.sorted {
    print("value \($0) : \($1)")
    return $0 < $1
}
print(sortedNumbers)








