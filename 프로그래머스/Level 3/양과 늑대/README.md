2진 트리를 만들고 백트래킹을 사용하는 문제이다.   
newNextNodes에 아직 안가본 곳을 전부 넣어둔다.   
늑대가 더 많아져서 못가본 노드는 일단 return 후 다른 노드를 방문   
그렇게 양을 계속해서 축적시키고 다시 방문   
위와 같은 과정을 반복한다.   
만약 모든 newNextNodes가 반환된다면 해당값이 최대값
```
import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    /*
    0은 양, 1은 늑대
    그래프 만들고 dfs로 순환하다가 늑대가 더 많아지면 다른 노드로 이동
    모든 노드를 가봐도 늑대가 다 많으면 return
    */
    var graph = Array(repeating: [Int](), count: info.count)
    for edge in edges {
        graph[edge[0]].append(edge[1])
    }
    print(graph)
    var result = 0
    func dfs(_ node: Int, _ nextNodes: [Int], _ sheep: Int, _ wolf: Int) {
        var newNextNodes = nextNodes
        var sheepCnt = sheep
        var wolfCnt = wolf
        if info[node] == 0 { sheepCnt += 1}
        else { wolfCnt += 1}
        // 방문할 수 있는 노드에서 현재 노드를 지우지 않고 리턴
        // 그렇다면 나중에 현재노드를 다시 들리게된다.
        if wolfCnt >= sheepCnt {return}
        
        result = max(result, sheepCnt)
        newNextNodes.append(contentsOf: graph[node] ?? [])
        //print(newNextNodes)
        // 방문한 노드 지우기
        if let idx = newNextNodes.firstIndex(of: node) {
            newNextNodes.remove(at:idx)
        }
        //print(newNextNodes)
        // 다시 못들렸던 곳부터 가보면서 이제는 갈수있나? 를 진행
        for i in newNextNodes {
            dfs(i, newNextNodes, sheepCnt, wolfCnt)
        }
        
    }
    dfs(0,[0],0,0)
    return result
}
```
위와 같은 예제일때   
윗 코드의 작동 순서는 다음과 같다.   
0 방문 sheepCnt = 1 wolfCnt = 0   
result = 1   
newNextNode = [0,1,2]   
0번 노드를 방문했을떄 아직 양의 수가 늑대보다 많았기에   
remove 0 , newNextNode = [1,2]   
dfs(1, [1,2],1,0)실행    

1 방문 sheepCnt = 1 wolfCnt = 1   
늑대의 수가 양과 크거나 같기에 일단 return   

dfs(2,[1,2],1,0)   
2 방문 sheepCnt = 2 wolfCnt = 0   
result = 2   
newNextNode = [1,2,5,6]   
2번 노드를 방문했을 때 아직 양의 수가 늑대보다 많았기에   
remove 2, newNextNode = [1,5,6]   
dfs(1, [1,5,6], 2, 0)실행   
   
다시 1번 노드를 방문해 이번에는 가능한지 확인   
1 방문 sheepCnt = 2 wolfCnt = 1   
result = 2
newNextNode = [1,5,6,3,4]   
1번 노드를 방문했을 때 아직 양의 수가 늑대보다 많았기에   
remove 1, newNextNode = [5,6,3,4]   
dfs(5, [5,6,3,4], 2, 1) 실행   
   
   
   
이와 같은 순서가 반복된다.   
이렇게 백트래킹을 통해 다시 방문하지 못헀던 노드들을 다시 방문하고   
양의 숫자를 늘려 다시 방문하고를 반복하여   
양의 수가 최고가 되도록 반복문을 실행한다.   
