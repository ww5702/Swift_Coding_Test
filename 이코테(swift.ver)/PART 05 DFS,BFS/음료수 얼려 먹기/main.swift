import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    
    var graph = [[Int]]()
    var count = 0
    
    for _ in 0..<n {
        graph.append(readLine()!.map{Int(String($0))!})
    }
    print(graph)
    func dfs(_ x : Int, _ y : Int) -> Bool {
        // 범위를 벗어나면 false
        if x <= -1 || x >= n || y <= -1 || y >= m {
            return false
        }
        if graph[x][y] == 0 {
            graph[x][y] = 1  // 방문 처리
            // 상하좌우 이동
            dfs(x - 1 , y) // 상
            dfs(x + 1 , y) // 하
            dfs(x , y - 1) // 좌
            dfs(x , y + 1) // 우
            
            return true // 주변이 다 막혀있다면 true 반환
                
        }
        
        return false
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if dfs(i, j) {
                count += 1
            }
        }
    }
    print(count)
    
//    func isInRange(_ x: Int, _ y: Int) -> Bool {
//        return (0..<n ~= x) && (0..<m ~= y)
//    }
//      범위를 벗어났는지와 같은 의미
}
solution()
