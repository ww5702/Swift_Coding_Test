import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])     // 3 7
    var k = Array(repeating: 0, count: n)
    for i in 0..<n {
        k[i] = Int(readLine()!)!
    } // 2 3 5
    var d = Array(repeating: 10001, count: m+1)
    d[0] = 0
    for i in 0..<n {
        for j in k[i]..<m+1 {
            d[j] = min(d[j], d[j-k[i]] + 1)
        }
        print(d)
    }
    if d[m] == 10001 {
        print(-1)
    } else {
        print(d[m])
    }
}
solution()
