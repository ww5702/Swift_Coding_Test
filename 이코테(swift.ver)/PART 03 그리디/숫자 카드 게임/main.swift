import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var result = 0
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        if result < value.min()! {
            result = value.min()!
        }
    }
    print(result)
}
solution()
