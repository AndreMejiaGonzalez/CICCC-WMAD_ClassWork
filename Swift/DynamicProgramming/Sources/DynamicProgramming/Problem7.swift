func TotalNonDecreasing() {
    let N = Int(readLine()!)!
    if N == 1 {
        print(10)
    } else {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: 10)
        for i in 0..<10 {
            dp[i][1] = 1
        }
        for digit in 0..<10 {
            for i in 2...N {
                for x in 0...digit {
                    dp[digit][i] += dp[x][i - 1]
                }
            }
        }
        var count = 0
        for i in 0..<10 {
            count += dp[i][N]
        }
        print(count)
    }
}