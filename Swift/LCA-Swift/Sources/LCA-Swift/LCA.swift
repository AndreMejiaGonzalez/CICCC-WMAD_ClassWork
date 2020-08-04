import Foundation

func FindLCA() {

    let n = Int(readLine()!)!
    var adjList = [[Int]](repeating: [], count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)
    var depth = [Int](repeating: 0, count: n + 1)
    var parent = [Int](repeating: 0, count: n + 1)
    let queue = Queue<Int>()

    for _ in 1..<n {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[v].append(u)
        adjList[u].append(v)
    }

    let m = Int(readLine()!)!
    queue.enqueue(item: 1)

    parent[1] = 1
    depth[1] = 1
    visited[1] = true

    while !queue.isEmpty() {
        let first = queue.dequeue()!
            
        for v in adjList[first] {
            if !visited[v] {
                parent[v] = first
                depth[v] = depth[parent[v]] + 1
                queue.enqueue(item: v)
                visited[v] = true
                }
            }
        }
        for _ in 0..<m {
        let inputPair = readLine()!.split(separator: " ")
        var p = Int(inputPair[0])!
        var q = Int(inputPair[1])!

        while depth[p] != depth[q] {
            if depth[p] > depth[q] {
                p = parent[p]
            } else {
                q = parent[q]
            }
        }
        while p != q {
            p = parent[p]
            q = parent[q]
        }
        print("Output: \n\(p)")
    }
}