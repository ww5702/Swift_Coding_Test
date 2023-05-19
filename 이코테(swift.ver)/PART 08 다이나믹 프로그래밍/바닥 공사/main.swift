import Foundation
func solution() {
    let n = Int(readLine()!)!
    var arr = Array(repeating: 0, count: 1000)
    arr[1] = 1
    arr[2] = 3
    for i in 3...n {
        arr[i] = arr[i-1] + (arr[i-2]*2)
    }
    print(arr[n] % 796)
}
solution()
