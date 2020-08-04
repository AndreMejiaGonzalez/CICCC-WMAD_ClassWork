class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var charMap = [Int](repeating:0, count: 26)
        for c in tasks {
            var asciiC = Int(c.asciiValue!)
            var asciiA = Int(Character("A").asciiValue!)
            charMap[asciiC - asciiA] += 1
        }
        charMap = charMap.sorted()
        var maxVal = charMap[25] - 1
        var idleSlots = maxVal * n
        
        for i in stride(from: 24, through: 0, by: -1) {
            idleSlots -= min(charMap[i], maxVal)
        }
        if idleSlots > 0 {
            return idleSlots + tasks.count
        } else { return tasks.count }
    }
}