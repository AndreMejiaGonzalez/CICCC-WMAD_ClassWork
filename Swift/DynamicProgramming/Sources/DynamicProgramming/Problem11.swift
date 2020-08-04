func Pokemon() {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let N = firstLine[0]
    let M = firstLine[1]
    var matrix = [[Int]]()
    for i in 0..<N {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        matrix.append(row)
    }

    var pathsArray = [Int]()
    
    func searchPaths(_ x: Int, _ y: Int, _ counter: Int) {
        if x < M - 1 {
            searchPaths(x + 1, y, counter + matrix[y][x])
        }
        if y < N - 1 {
            searchPaths(x, y + 1, counter + matrix[y][x])
        }
        if x == M - 1 && y == N - 1 {
            pathsArray.append(counter + matrix[y][x])
        }
    }

    searchPaths(0,0,0)

    print(pathsArray.max()!)
}