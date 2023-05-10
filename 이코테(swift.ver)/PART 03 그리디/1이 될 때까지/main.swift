import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,k) = (input[0],input[1])
    var count = 0
    while true {
        if n % k == 0 {
            n /= k
            count += 1
        } else {
            n -= 1
            count += 1
        }
        if n == 1 { break }
    }
    print(count)
}
solution()
