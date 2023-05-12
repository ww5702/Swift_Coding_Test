import Foundation
func solution() {
    let graph = [
    [],         //0
    [2,3,8],    //1
    [1,7],      //2
    [1,4,5],    //3
    [3,5],      //4
    [3,4],      //5
    [7],        //6
    [2,6,8],    //7
    [1,7]       //8
    ]
    var visited = Array.init(repeating: false, count: graph.count)
    print(graph)
    print(visited)
    func dfs(start: Int) {
        visited[start] = true // 시작지점
        print(start, terminator: " ")
        for i in graph[start] {
            if !visited[i] {
                dfs(start: i)
            }
            
        }
    }
    
    dfs(start: 1)
}
solution()
