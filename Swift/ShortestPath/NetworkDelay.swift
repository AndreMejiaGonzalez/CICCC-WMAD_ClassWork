class Solution {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        struct Edge {
            var to: Int
            var cost: Int
        }
        
        var adj = [[Edge]](repeating: [], count: N + 1)
        var dist = [Int](repeating: Int.max, count: N + 1)
        var checked = [Bool](repeating: false, count: N + 1)
        
        for i in times {
            var tmp = Edge(to: i[1], cost: i[2])
            adj[i[0]].append(tmp)
        }
        
        dist[K] = 0
        
        for _ in 0..<N - 1 {
            var min = Int.max
            var u = 1
            for i in 1...N {
                if !checked[i] && dist[i] < min {
                    min = dist[i]
                    u = i
                }
            }
            
            checked[u] = true
            for edge in adj[u] {
                let v = edge.to
                if dist[v] > dist[u] + edge.cost {
                    dist[v] = dist[u] + edge.cost
                }
            }
        }
        
        dist.remove(at: 0)
        var res = dist.max()!
        for i in 0..<dist.count {
            if dist[i] == Int.max {
                res = -1
            }
        }
        return res
    }
}