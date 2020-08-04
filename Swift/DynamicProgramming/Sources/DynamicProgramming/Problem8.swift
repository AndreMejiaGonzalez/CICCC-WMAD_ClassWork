func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var dp = [Int](repeating: 0, count: nums.count)
    dp[0] = 1;
    var maxans = 1
    for i in 1..<dp.count {
        var maxval = 0
        for j in 0..<i {
            if nums[i] > nums[j] {
                maxval = max(maxval, dp[j])
            }
        }
        dp[i] = maxval + 1
        maxans = max(maxans, dp[i])
    }
    return maxans
}