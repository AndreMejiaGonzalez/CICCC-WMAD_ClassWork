func TwoxNTiles() {
    let N = Int(readLine()!)!
    var res = [Int](repeating: 0, count: N+2)
    res[0] = 0
    res[1] = 1
    for i in 2..<res.count{
        res[i] = res[i-1] + res[i-2]
    }
    print(res[N+1])
}