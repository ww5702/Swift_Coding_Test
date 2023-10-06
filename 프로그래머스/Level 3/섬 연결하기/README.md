최종(주석 설명문 포함)   
```
import Foundation
// 크루스칼 알고리즘
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    // 처음에는 각자 각자의 노드가 최상위 노드라고 생각하고 시작
    var parents: [Int] = (0...n-1).map{$0}
    // 제일 중요한 최저비용을 기준으로 정렬
    let costs = costs.sorted{$0[2] < $1[2]}
    
    // 최상위 부모 등록
    func unionSet(_ start: Int, _ end: Int) {
        var start = start, end = end
        
        // 각자의 부모노드 찾기
        start = findSet(start)
        end = findSet(end)
        // 다르다면 변경해주기
        if start != end {
            parents[end] = start
        }
        
    }
    
    // 최상위 부모 찾기
    func findSet(_ start : Int) -> Int {
        // 자기자신이 최상위 부모라면 return
        if parents[start] == start {
            return start
        } else {
            // 계속해서 재귀함수로 부모의 부모의 부모노드 찾아가기
            let parent = findSet(parents[start])
            // 그렇게 찾은 부모노드를 자신의 부모노드로 바꾸기
            parents[start] = parent
            
            // 그리고 그전까지 자신을 부모로 생각하던 노드들 전부 바꿔주기
            for i in 0..<parents.count {
                if parents[i] == start {
                    parents[i] = parent
                }
            }
            return parent
        }
        
    }
    
    // 최저 비용으로 하나의 사이클을 만드는데 드는 비용을 위한 변수
    var result = 0
    // 반복문
    for cost in costs {
        let start = findSet(cost[0])
        let end = findSet(cost[1])
        let value = cost[2]
        
        // 만약 각자의 노드의 부모노드가 다르다면 연결
        if start != end {
            // 노드 연결 + value
            result += value
            // 그리고 end노드를 start노드의 부모노드로 최상위노드를 변경
            unionSet(start, end)
        }
    }
    return result
}
```



최종 제출 전 여러 시도들      
------   

비용을 거리로 바꿔서 다익스트라로 풀수있을것같았다.   
0번노드에서 출발해서 각 노드들까지 최소 비용을 계산하면 값이 나올것같았지만   
테스트케이스를 예로 들면   
0번에서 1,2,3까지 가는 최단비용은 1,2,2이다.   
하지만 정답은 4이다.    
1에서 3으로 가는 비용은 1이기 떄문이다.   

```
import Foundation
// 비용을 거리로 바꾼다면 똑같이 다익스트라로 할수있을것같다.
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n)
    var costArr = Array(repeating: Array(repeating: 987654321, count: n), count: n)
    for cost in costs {
        graph[cost[0]].append(cost[1])
        graph[cost[1]].append(cost[0])
        costArr[cost[0]][cost[1]] = cost[2]
        costArr[cost[1]][cost[0]] = cost[2]
    }
    print(graph)
    print(costArr)
    var costCnt = Array(repeating: 987654321, count: n)
    costCnt[0] = 0
    
    func dijikstra(_ graph: [[Int]]) -> Int {
        var q: [Int] = []
        q.append(0)
        
        while !q.isEmpty {
            let now = q.removeFirst()
            for i in graph[now] {
                if costCnt[i] > costArr[now][i] + costCnt[now] {
                    costCnt[i] = costArr[now][i] + costCnt[now]
                    q.append(i)
                }
            }
        }
        print(costCnt)
        return costCnt.reduce(0,+)
    }
    return dijikstra(graph)
}
```
따라서 각 노드별로 갈수있는 최단비용을 구해보았다.   
```
import Foundation
// 비용을 거리로 바꾼다면 똑같이 다익스트라로 할수있을것같다.
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n)
    var costArr = Array(repeating: Array(repeating: 987654321, count: n), count: n)
    for cost in costs {
        graph[cost[0]].append(cost[1])
        graph[cost[1]].append(cost[0])
        costArr[cost[0]][cost[1]] = cost[2]
        costArr[cost[1]][cost[0]] = cost[2]
    }
    print(graph)
    print(costArr)
    var result = Array(repeating: [Int](), count: n)
    func dijikstra(_ node: Int, _ graph: [[Int]]){
        var costCnt = Array(repeating: 987654321, count: n)
        var q: [Int] = []
        q.append(node)
        costCnt[node] = 0
        
        while !q.isEmpty {
            let now = q.removeFirst()
            for i in graph[now] {
                if costCnt[i] > costArr[now][i] + costCnt[now] {
                    costCnt[i] = costArr[now][i] + costCnt[now]
                    q.append(i)
                }
            }
        }
        print(costCnt)
        result[node] = costCnt
    }
    for i in 0..<n {
        dijikstra(i, graph)
    }
    print(result)
    return 0
}
```
이렇게해서는 사이클이 형성되는지 알수없다.   
풀이를 살펴보니 크루스칼 알고리즘을 이용해 최소비용신장트리를 구성할 수 있었다.   
```
import Foundation
// 크루스칼 알고리즘
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var parents: [Int] = (0...n-1).map{$0}
    let costs = costs.sorted{$0[2] < $1[2]}
    print(parents)
    print(costs)
    
    // 최상위 부모 등록
    func unionSet(_ start: Int, _ end: Int) {
        //print("최상위 부모인지 확인 시작")
        var start = start, end = end
        
        start = findSet(start)
        end = findSet(end)
        if start != end {
            parents[end] = start
            //print("최상위 부모 등록 ",parents)
        }
        
    }
    
    // 최상위 부모 찾기
    func findSet(_ start : Int) -> Int {
        // 자기자신이 최상위 부모라면 return
        if parents[start] == start {
            //print("자기자신 최상위부모",start, parents)
            return start
        } else {
            let parent = findSet(parents[start])
            parents[start] = parent
            
            // 그전까지 자신을 부모로 생각하던 노드들 전부 바꿔주기
            for i in 0..<parents.count {
                if parents[i] == start {
                    parents[i] = parent
                }
            }
            //print("최상위부모 변경",start, parents)
            return parent
        }
        
    }
    
    var result = 0
    for cost in costs {
        let start = findSet(cost[0])
        let end = findSet(cost[1])
        //print(start,end)
        let value = cost[2]
        
        if start != end {
            result += value
            unionSet(start, end)
        }
        //print(result)
    }
    return result
}
```
크루스칼 알고리즘을 이해하는데 참고한 블로그입니다.   
https://gmlwjd9405.github.io/2018/08/29/algorithm-kruskal-mst.html   
