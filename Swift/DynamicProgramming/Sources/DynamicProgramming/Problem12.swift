extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

func numDecodings(_ s: String) -> Int {
    var dp = [Int](repeating: 0, count: s.count + 1)
    dp[0] = 1

    for i in 0..<s.count {
        let singleDigitNum = Int(s[i])!
        if singleDigitNum != 0 {
            dp[i + 1] = dp[i]
        }

        if i >= 1 {
            let doubleDigiNum = Int(s[i - 1] + s[i])!
            if doubleDigiNum >= 10 && doubleDigiNum <= 26 {
                dp[i + 1] += dp[1 - 1]
            }
        }
    }
    return dp[s.count]
}