import Foundation
func solution() {
    let n = Array(readLine()!).map{Int(String($0))!}
    print(n)
    var result = 0
    for i in n {
        if i == 0 { continue }
        else if result == 0 || i == 1{
            result += i
        } else {
            result *= i
        }
    }
    print(result)
}
solution()
