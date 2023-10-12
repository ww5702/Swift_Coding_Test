bfs로 최소비용을 구해가는 문제이다.   
다른 bfs 문제들과 같지만 다른점이 있다면 방향을 설정해주어야 한다는것이다 (0,1,2,3) (상,우,하,좌)   
정해진 도면의 크기를 넘어가지 않으면서 벽이 아닐때, 같은 방향으로 다음칸을 나아간다면 + 100원   
다른 방향으로 나아간다면 회전 후 직진이기에 + 600원으로 매 순간순간의 최소값을 저장해나가면 된다.   
시작방향은 0,0에서 0,1로 가는 오른쪽 (0,1,100,1)   
0,0에서 1,0으로 가는 밑쪽 (1,0,100,2)   
두가지 방향으로 출발하면 된다.   
```
import Foundation

func solution(_ board:[[Int]]) -> Int {
    /*
    bfs 최소비용 구하기
    해당 배열에 도착하는 경우의 수
    직진하는 경우 = 100원
    코너 + 직진하는 경우 = 600원
    
    1 2 3
    4 5 6
    7 8 9
    에서 5로 가는 방법은
    2,4,6,8에서 직진하여 5로 가는방법
    1,3,7,9에서 직진후 회전하여 직진하는 방법
    하지만 "1" 벽으로 이루어져있으면 계산 x
    또한 오른쪽에서 접근하는 방향은 취급 x
    
    */
    let size = board.count
    let direction = [[-1,0,1,0],[0,1,0,-1]]
    var dp = Array(repeating: Array(repeating: Int.max, count: size), count: size)
    dp[0][0] = 0
    // 벽을 넘어가지않았는가
    func isOk(_ x: Int, _ y: Int) -> Bool {
        if x < 0 || x >= size || y < 0 || y >= size {
            return false
        }
        return true
    }
    // x,y,비용,방향 
    func dfs(_ x: Int, _ y: Int, _ cost: Int, _ dir: Int) {
        // 만약 벽이거나 애초에 큰 값이라면 비교할필요가 없기에 return
        if board[x][y] == 1 || cost > dp[x][y] {
            return
        }
        //print(x,y,dp[x][y], cost)
        dp[x][y] = cost
        
        
        // 상하좌우로 탐색
        for idx in 0..<4 {
            let nx = x + direction[0][idx]
            let ny = y + direction[1][idx]
            // 해당 좌표가 벽을 넘거가진 않았는지
            if isOk(nx,ny) {
                // 같은 방향이었다면 + 100
                if dir == idx {
                    dfs(nx,ny,cost+100,idx)
                } else {
                // 방향을 돌려서 직진한다면 + 600
                    dfs(nx,ny,cost+600,idx)
                }
            }
        }
    }
    // 출발방향은 오른쪽으로 가거나, 밑으로 가거나 둘중 하나이기에
    dfs(0,1,100,1)
    dfs(1,0,100,2)
                     
    return dp[size-1][size-1]
}
```
