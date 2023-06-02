import Foundation
func solution() {
    var nm = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,m) = (nm[0],nm[1])
    var kg = Array(readLine()!.split(separator: " ").map{Int($0)!})
    var array = Array(repeating: 0, count: 11)
    for x in kg {
        array[x] += 1
    }
    var result = 0
    for i in 1..<m+1 {
        n -= array[i]
        result += array[i] * n
    }
    print(result)
    
}
solution()
