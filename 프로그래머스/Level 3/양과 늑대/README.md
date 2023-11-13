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
