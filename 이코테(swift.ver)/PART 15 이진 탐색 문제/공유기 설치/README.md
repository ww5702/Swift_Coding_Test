무엇을 기준으로 이진 탐색할것인지 정해야한다.   
공유기의 거리를 기준으로 이진탐색을 진행하는데   
1,2,4,8,9  c = 3을 기준으로 예시를 들었을 때   
공유기의 최대 거리는 1~8이다.   
start = 1, end = 8로 시작한다.   
mid값에 따라 for문을 통해 1부터 반복문을 실행한다.   
만약 mid값만큼 거리가 떨어진 집이라면 공유기를 설치하고 해당값으로 prev를 바꿔준다.   
만약 공유기의 수가 c보다 적다면 더 적은 거리를 기준으로 설치를 다시해봐야 하기에 end를 mid-1로   
공유기 수가 많다면 더 먼 거리로 다시 시도해보아야 하기에 start를 mid+1로 반복한다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,c) = (input[0],input[1])
    var arr: [Int] = []
    for _ in 0..<n {
        let input = Int(readLine()!)!
        arr.append(input)
    }
    arr.sort(by:<)
    print(arr)
    let max = arr[n-1]
    let min = arr[0]
    var start = 1, end = max - min
    while start <= end {
        var cnt = 1
        let mid = (start+end)/2
        print(mid)
        var prev = arr[0]
        
        for i in 1..<n {
            let cur = arr[i]
            if cur - prev >= mid {
                cnt += 1
                prev = cur
            }
        }
        print(cnt)
        print()
        if cnt < c {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
}
solution()
                     

/*
 5 3
 1
 2
 8
 4
 9
 */


```
