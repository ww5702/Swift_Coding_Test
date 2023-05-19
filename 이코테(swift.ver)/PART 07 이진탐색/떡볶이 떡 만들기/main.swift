import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var dduk = Array(readLine()!.split(separator: " ").map{Int($0)!})
    dduk.sort(by: <)
    var start = 0
    var end = dduk.max()!
    var result = 0
    while start <= end {
        var total = 0
        let mid = (start + end) / 2
        for i in dduk {
            if i >= mid {
                total += (i-mid)
            }
        }
        if total < m {
            end = mid - 1
        } else {
            result = mid
            print(result)
            start = mid + 1
        }
    }
    print("최종 : \(result)")
}
solution()
