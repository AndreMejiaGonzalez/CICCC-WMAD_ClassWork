func MakeOne() {
    var N = Int(readLine()!)!
    var operations = 0
    while N != 1 {
        if !N.isMultiple(of: 3) {
            if (N - 1).isMultiple(of: 3) {
                N -= 1
                operations += 1
                continue
            }
            else if (N/2).isMultiple(of: 3) {
                N = N/2
                operations += 1
                continue
            } else {
                N -= 1
                operations += 1
                continue
            }
        }
        N = N/3
        operations += 1
        continue
    }
    print(operations)
}