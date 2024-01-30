# 최소 비용으로 그래프의 모든 정점을 연결해 봅시다.	

## 9372 상근이의 여행
무조건 연결되어있는 비행스케쥴이다.   
따라서 n-1만 하면 정답에 도달하는 꼼수가 존재한다.   
이 이유는 갔던 경로를 또 가더라도 결과에 영향을 주지 않는 조건때문이다.   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (n,m) = (input[0],input[1])
        var graph: [[Int]] = Array(repeating: [], count: n+1)
        for i in 0..<m {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            graph[input[0]].append(input[1])
            graph[input[1]].append(input[0])
        }
        //print(graph)
        print(n-1)
    }
}
solution()

```
