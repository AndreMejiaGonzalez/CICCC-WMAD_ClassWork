struct edge {
    var cost = -1
    var nodes = [Int](repeating: 0, count: 2)
    var active = false
}

func MCF() {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = firstLine[0]
    let m = firstLine[1]
    var edges = [edge]()
    var nodes = [Int](repeating: 0, count: n)
    var count = 0

    for i in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        var tmp = edge()
        tmp.nodes[0] = line[0]
        tmp.nodes[1] = line[1]
        tmp.cost = line[2]
        edges.append(tmp)
        if count < n - 1 {
            edges[i].active = true
        }
        count += 1
    }
    
    var targetCosts = [Int]()
    for edge in edges {
        targetCosts.append(edge.cost)
    }
    targetCosts.sort()

    var optimalEdges = [Bool](repeating: false, count: m)
    var activated = 0
    var j = 0
    while activated < n - 1 {
        for i in 0..<m {
            if edges[i].cost == targetCosts[j] && activated < n - 1 {
                if nodes[edges[i].nodes[0] - 1] < 2 || nodes[edges[i].nodes[1] - 1] < 2 {
                    optimalEdges[i] = true
                    nodes[edges[i].nodes[0] - 1] += 1
                    nodes[edges[i].nodes[1] - 1] += 1
                    activated += 1
                    j += 1
                }
            }
        }
    }

    var changes = 0
    for i in 0..<n - 1 {
        if optimalEdges[i] == false {
            changes += 1
        }
    }
    print(changes)
}