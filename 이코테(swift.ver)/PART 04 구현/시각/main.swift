import Foundation
func solution() {
    let n = Int(readLine()!)!
    var count: Int =  0
    for i in 0...n {
        for j in 1...60 {
            for k in 1...60 {
                let value = "\(i)\(j)\(k)"
                if value.contains("3") {
                    count += 1
                }
            }
        }
    }
    print(count)
}
solution()
