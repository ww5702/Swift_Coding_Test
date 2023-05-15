import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var queue = [(0,0)] // 시작 지점
    var map = [[Int]]()
    
    for _ in 0..<n {
        map.append(readLine()!.map{Int(String($0))!})
    }
    // 이동 방향 상 하 좌 우
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    // 큐가 빌 때까지 반복
    func bfs(_ x : Int, _ y : Int) {
        while !queue.isEmpty {
            let (x,y) = queue.removeFirst()
            
            // 상하좌우 이동
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx < 0 || ny < 0 || nx >= n || ny >= m || map[nx][ny] == 0 { continue }  // 경로를 벗어날 경우 무시
                if map[nx][ny] == 0 { continue } // 괴물이 있는 곳일 경우 무시
                // 방문한 곳이 안전한 곳이라면 지금까지 왔던 거리의 + 1
                if map[nx][ny] == 1 {
                    map[nx][ny] = map[x][y] + 1
                    queue.append((nx,ny))
                }
            }
        }
        print(map[n-1][m-1])
        
        // 끝났을 때의 거리 계산을 위한 참고용
        print(map)
    }
    bfs(0, 0)
    
}
solution()
