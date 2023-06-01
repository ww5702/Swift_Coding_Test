import Foundation
func solution() {
    let n = Int(readLine()!)!
    var value = readLine()!.split(separator: " ").map{Int($0)!}
    value.sort(by: <)
    var count = 0
    var result = 0
    for i in 0..<value.count {
        count += 1
        if value[i] <= count {
            result += 1
            count = 0
        }
    }
    print(result)
}
solution()
