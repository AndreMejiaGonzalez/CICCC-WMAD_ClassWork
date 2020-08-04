func TomatoBox() {

    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let m = firstLine[0]
    let n = firstLine[1]
    var matrix = [[Int]]()

    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        matrix.append(row)
    }

    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    var currentIteration = matrix
    var nextIteration = matrix
    var count = 0

    var solved: Bool {
        for x in 0..<currentIteration.count {
            for y in 0..<currentIteration[x].count {
                if currentIteration[x][y] == 0 { return false }
            }
        }
        return true
    }

    while !solved && !(count > (n * m)) {
        count += 1
        for x in 0..<currentIteration.count {
            for y in 0..<currentIteration[x].count {
                if currentIteration[x][y] == 1 || currentIteration[x][y] == -1 {
                    nextIteration[x][y] = currentIteration[x][y]
                }
                else {
                    for i in 0..<4 {
                        let nx = x + dx[i]
                        let ny = y + dy[i]
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            if currentIteration[nx][ny] == 1 {
                                nextIteration[x][y] = 1
                            }
                        }
                    }
                }
            }
        }
        currentIteration = nextIteration
    }
    
    if count > (n * m) {
        count = -1
    }

    print(count)
}