마지막 권은 안돌아와도 된다.   
이게 포인트이다.   
따라서 음수던 양수던 가장 먼쪽으로 m권을 들고가면서 가져다 둠과 동시에 종료하면된다.   
따라서 음(left) 양(right)을 정리하고   
더 큰 값을 선정해 해당값을 한번만 더해주면서 m권 제거해준다.   
남은 배열들을 순환하면서   
m권듦과 동시에 왔다갔다하므로 last*2깂을 더해준다.   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var left: [Int] = []
    var right: [Int] = []
    for b in board {
        if b < 0 {
            left.append(abs(b))
        } else {
            right.append(b)
        }
    }
    left.sort(by:<)
    right.sort(by:<)
    
    var result = 0
    
    func remove(_ arr: inout [Int]) {
        let last = arr.last ?? 0
        for _ in 0..<min(m, arr.count) {
            arr.removeLast()
        }
        result += last
    }
    
    if left.last ?? 0 < right.last ?? 0 {
        remove(&right)
    } else {
        remove(&left)
    }
    
    while !left.isEmpty || !right.isEmpty {
        var value = left.last ?? 0
        for _ in 0..<min(m, left.count) {
            left.removeLast()
        }
        result += (value*2)
        
        value = right.last ?? 0
        for _ in 0..<min(m, right.count) {
            right.removeLast()
        }
        result += (value*2)
    }
    print(result)
}

solution()
/*
 */
  

```
