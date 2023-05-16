import Foundation
func solution() {
    let n = Int(readLine()!)!
    var arr: [(String,Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        arr.append((input[0],Int(input[1])!))
    }
    let result = arr.sorted{$0.1 > $1.1}
    for i in result {
        print(i.0, terminator: " ")
    }
}
solution()
