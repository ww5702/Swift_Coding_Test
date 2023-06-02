import Foundation
func solution() {
    let n = Array(readLine()!).map{Int(String($0))!}
    print(n)
    let mid = n.count / 2
    var first = 0, second = 0
    for i in 0..<n.count {
        if i < mid {
            first += n[i]
        } else {
            second += n[i]
        }
        print(first, second)
    }
    if first == second { print("LUCKY") }
    else { print("READY") }
}
solution()
