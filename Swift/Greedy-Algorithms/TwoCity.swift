class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var costs = costs
        let n = costs.count/2
        var total = 0
        var cityA = 0
        var cityB = 0
        costs = costs.sorted(by: { abs($0[0] - $0[1]) > abs($1[0] - $1[1]) })
        for i in costs {
            if cityA < n && cityB < n {
                if i[0] < i[1] {
                    total += i[0]
                    cityA += 1
                } else {
                    total += i[1]
                    cityB += 1
                }
            } else {
                if cityA < n {
                    total += i[0]
                    cityA += 1
                } else {
                    total += i[1]
                    cityB += 1
                }
            } 
        }
        return total
    }
}