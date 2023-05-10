import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,k) = (input[0],input[1])
    var count = 0
    while true {
        if n % k == 0 {
            n /= k
            count += 1
        } else {
            let target = (n/k) * k
            // target은 즉 k의 배수이다.
            // K의 배수중 N에서 가장 가까운 배수를 미리 구해주는 점화식이다.
            count += (n-target)
            n = target
        }
        if n == 1 { break }
    }
    print(count)
}
solution()
