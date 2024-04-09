1차식, 3차식과 같은 홀수 차식에서는 최소값이 되는 값은 항상 1개입니다   
그리고 2차식, 4차식과 같은 짝수 차식에서는 오름차순으로 x 절편을 정렬했을 때    
중앙의 두 값을 포함한 사이 값들이 최소값이 되는 값들입니다.    
y = |x| + |x-5| 에서 오름차순으로 정렬한 x 절편들은 [0, 5] 입니다.    
여기에서 중앙의 두 값을 포함한 사이의 값 0에서 5가 모두 y가 최소가 되는 값들입니다.   
y = |x| + |x-5| + |x-7| + |x-10| 에서 오름차순으로 정렬한 x의 절편들은 [0, 5, 7, 10] 입니다.   
여기에서 중앙의 두 값을 포함한 사이의 값은 5에서 7이 모두 y가 최소가 되는 값들입니다.   
이런 규칙성으로 풀이해야 한다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr: [Int] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        arr.append(input[1] - input[0])
    }
    arr.sort()
    //print(arr)
    
    var answer = 0
    if arr.count % 2 == 0 {
        let start = (arr.count / 2) - 1
        answer = arr[start+1] - arr[start] + 1
    } else {
        answer = 1
    }
    print(answer)
}
solution()



```
