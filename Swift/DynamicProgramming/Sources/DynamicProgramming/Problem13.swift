func maxSubArray(_ nums: [Int]) -> Int {
    var maxEnd = nums[0]
    var maxSoFar = nums[0]
    for i in 1..<nums.count {
        maxEnd = max(nums[i], maxEnd + nums[i])
        maxSoFar = max(maxSoFar, maxEnd)
    }
    return maxSoFar
}