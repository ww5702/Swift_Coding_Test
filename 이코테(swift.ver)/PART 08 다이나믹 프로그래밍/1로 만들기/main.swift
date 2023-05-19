import Foundation
func solution() {
    let x = Int(readLine()!)!
    var d = Array(repeating: 0, count: 30)
    for i in 2...x+1 {
        d[i] = d[i-1] + 1 // 1을 빼는 경우
        if i % 2 == 0 {     // 2로 나눠지는 경우
                            // 예를 들어 6의 경우 5에서 +1을 해줄수도 3에서 2를 곱해줄수도 있는데
                            // 둘중 6으로 도달하는 횟수가 적은것을 골라주는 개념이다.
            d[i] = min(d[i], d[i/2] + 1)
        }
        if i % 3 == 0 {     // 3으로 나눠지는 경우
            d[i] = min(d[i], d[i/3] + 1)
        }
        if i % 5 == 0 {     // 5로 나눠지는 경우
            d[i] = min(d[i], d[i/5] + 1)
        }
    }
    print(d[x])
}
solution()
