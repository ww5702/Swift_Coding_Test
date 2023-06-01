import Foundation
func solution() {
    let n = Array(readLine()!).map{Int(String($0))!}
    print(n)
    var count1 = 0
    var count0 = 0
    if n[0] == 1 {
        count1 += 1
    } else {
        count0 += 1
    }
    for i in 1..<n.count {
        if n[i] == 0 {
            if n[i-1] == 1 {
                count0 += 1
            } else { continue }
        } else {
            if n[i-1] == 0 {
                count1 += 1
            } else { continue }
        }
    }
    print(count0, count1)
    print(min(count0, count1))
}
solution()
