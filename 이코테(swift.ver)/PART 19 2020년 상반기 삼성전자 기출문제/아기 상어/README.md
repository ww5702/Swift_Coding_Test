bfs와 구현을 이용한 풀이이다.   
맞긴한데 뭔가 가독성이 떨어지는 느낌이다.   
풀이 시간을 줄여보자   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var map = Array(repeating: Array(repeating: 0, count: n), count: n)
    var shark: [(Int,Int)] = []
    var time = 0
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<n {
            map[i][j] = input[j]
            if input[j] == 9 {
                shark.append((i,j))
                map[i][j] = 0
            }
        }
    }
    //print(map)
    var body = 2    // 먹어야 하는 물고기 수
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    var food: [(Int,Int)] = []
    func bfs(_ shark: [(Int,Int)]) -> [(Int,Int)]{
        var q: [(Int,Int)] = []
        var idx = 0
        
        while shark.count > idx {
            let now = shark[idx]
            idx += 1
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                // 맵을 넘어가지않고, 먹을 수 있는 음식이 있다면 append
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if (1...body).contains(map[newY][newX]) && !visited[newY][newX]{
                        // 몸집이 작다면 먹을 수 있다.
                        if body > map[newY][newX] {
                            food.append((newY,newX))
                        }
                    }
                    
                    if !visited[newY][newX] {
                        // 몸집이 같거나 작아야만 이동 가능
                        if map[newY][newX] <= body {
                            q.append((newY, newX))
                        }
                        visited[newY][newX] = true
                    }
                    
                }
            }
        }
        
        return q
    }
    var eat = 0
    
    
    while true {
        //print("시간",time)
        var limit = 1
        visited = Array(repeating: Array(repeating: false, count: n), count: n)
        visited[shark[0].0][shark[0].1] = true
//        print(shark)
//        for i in 0..<n {
//            print(map[i])
//        }
        while limit < n*n {
            let q = bfs(shark)
            
            // 먹을 음식이 있다면 멈춤
            if !food.isEmpty {
                // 먹이가 있다면 위먼저, 위가 같다면 왼쪽에 있는 물고기 기준으로 정렬
                //print("정렬 전",food)
                food.sort(by: {$0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0})
                // 상어 위치 재정립
                shark = [(food[0].0, food[0].1)]
                // 먹은 물고기 위치 0
                map[shark[0].0][shark[0].1] = 0
                break
            }
            
            //print(q)
            // 다시 이동한 좌표를 기준으로 한칸씩 더 이동
            shark = q
            limit += 1
        }
        
        //print("food = ",food,"shark = ", shark, limit)
        // 물고기 하나 먹기
        eat += 1
        //print("먹은 횟수",eat)
        // 몸집 키우기
        if eat == body && body < 7 {
            body += 1
            eat = 0
            //print("몸집 커짐",body)
        }
        // 맵 끝까지 다 움직였음애도 없다면 break
        if food.isEmpty { break }
        // 음식 초기화
        food = []
        time += limit
    }
    
    print(time)
}
solution()
/*
3
1 0 0
0 0 0
0 9 0
 
3
1 0 0
0 2 0
1 9 3
 */

```
