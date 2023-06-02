import Foundation
func solution() {
    var S = Array(readLine()!).map{String($0)}
    print(S)
    S.sort(by: >)
    var sum = 0
    for i in S {
        if Int(UnicodeScalar(i)!.value) <= 57 { sum += Int(i)! }
        else { print(i,terminator: "") }
    }
    print(sum)
}
solution()
