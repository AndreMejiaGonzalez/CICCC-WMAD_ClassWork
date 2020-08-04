func OneTwoThree() {
    let N = Int(readLine()!)!

    func GetOneTwoThree(_ M: Int) {
        var res = [Int](repeating: 0, count: M + 1)
        res[0] = 1
        res[1] = 1
        res[2] = 2
        for i in 3..<res.count {
            res[i] = res[i - 3] + res[i - 2] + res[i - 1]
        }
        print(res[M])
    }

    for _ in 0..<N {
        GetOneTwoThree(Int(readLine()!)!)
    }
}