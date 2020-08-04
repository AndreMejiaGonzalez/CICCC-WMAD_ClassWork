extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}

func TotalPrettyNumbers() {
    let N = Int(readLine()!)!
    var num = N
    if num != 1 {
        num = Int("1" + String(repeating: "0", count: N - 1))!
    }
    var count = 0
    while !(num.digits.count > N) {
        if isPretty(num) { count += 1 }
        num += 1
    }
    print(count)
}

func isPretty(_ N: Int) -> Bool {
    let digitArray = N.digits
    for i in 0..<digitArray.count {
        if i - 1 > 0 {
            if abs(digitArray[i - 1] - digitArray[i]) != 1 { return false }
        }
        if i + 1 < digitArray.count {
            if abs(digitArray[i + 1] - digitArray[i]) != 1 { return false }
        }
    }
    return true
}