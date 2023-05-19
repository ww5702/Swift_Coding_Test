import Foundation
func solution() {
    let n = Int(readLine()!)!
    let food = readLine()!.split(separator: " ").map{Int($0)!}
    var arr = Array(repeating: 0, count: 100)
    arr[0] = food[0]
    arr[1] = max(food[0], food[1])
    for i in 2..<n {
        arr[i] = max(arr[i-1], (arr[i-2]+food[i]))
    }
    print(arr[n-1])
}
solution()
