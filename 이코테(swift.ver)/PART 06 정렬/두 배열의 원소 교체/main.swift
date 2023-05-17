import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var Aarr = readLine()!.split(separator: " ").map{Int($0)!}
    var Barr = readLine()!.split(separator: " ").map{Int($0)!}
    Aarr.sort(by: <)
    Barr.sort(by: >)
    for i in 0..<m {
        if Aarr[i] < Barr[i] {
            let temp = Aarr[i]
            Aarr[i] = Barr[i]
            Barr[i] = temp
        }
    }
    var sum = 0
    for i in Aarr {
        sum += i
    }
    print(Aarr)
    print(sum)
    
}
solution()
