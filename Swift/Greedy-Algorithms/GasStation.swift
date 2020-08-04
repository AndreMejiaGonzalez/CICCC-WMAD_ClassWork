class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let doubleGas = gas + gas
        let doubleCost = cost + cost
        var res = -1
        var steps = 0
        var r = 0
        for i in 0..<doubleGas.count {
            if ((r + doubleGas[i]) - doubleCost[i] > 0) {
                r = (r + doubleGas[i]) - doubleCost[i]
                steps += 1
                if res < 0 {
                    res = i
                }
            }
        }
        if steps < gas.count {
            res = -1
        }
        return res
    }
}