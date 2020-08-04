func Sushi() {
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    var adjList = [[Int]](repeating: [], count: n)
    var realRestaurants = [Int]()
    let secondLine = readLine()!.split(separator: " ")
    for i in 0..<m {
        realRestaurants.append(Int(secondLine[i])!)
    }
    var visited = [Bool](repeating:false, count: realRestaurants.count)

    var visitedAll: Bool {
        for i in visited {
            if !i { return i }
        }
        return true
    }

    for _ in 0..<n - 1 {
        let line = readLine()!.split(separator: " ")
        let a = Int(line[0])!
        let b = Int(line[1])!
        adjList[a].append(b)
        adjList[b].append(a)
    }
    for i in realRestaurants {
        var v = i
        while !visitedAll {
            
        }
    }
}