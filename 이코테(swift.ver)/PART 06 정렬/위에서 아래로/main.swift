import Foundation
func solution() {
    let n = Int(readLine()!)!
    var arr: [Int] = []
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    arr.sort(by: >)
    print(arr)
}
solution()
