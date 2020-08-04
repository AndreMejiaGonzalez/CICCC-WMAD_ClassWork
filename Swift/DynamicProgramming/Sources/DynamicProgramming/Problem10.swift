func searchTerms(_ n: Int, _ counter: Int, _ counterArray: inout [Int]) {
    if n == 0 || counter == 5 {
        counterArray.append(counter)
    } else {
        var mult = 1
        while mult * mult <= n {
            searchTerms(n - (mult * mult), counter + 1, &counterArray)
            mult += 1
        }
    }
}

func SumOfSquares() {
    let N = Int(readLine()!)!
    var counterArray = [Int]()

    searchTerms(N, 0, &counterArray)
    print(counterArray.min()!)
}