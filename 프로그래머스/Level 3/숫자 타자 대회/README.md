dfs와 bfs를 더해서 풀이해보았다.   
하지만 시간초과 발생   

```
import Foundation

func solution(_ numbers:String) -> Int {
    // 상하좌우 대각선 상하좌우
    let dy = [1,-1,0,0,-1,-1,1,1]
    let dx = [0,0,1,-1,-1,1,-1,1]
    var numPad = [(3,2),(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,0),(2,1),(2,2)]

    var leftHand = (1,0)
    var rightHand = (1,2)
    var ans = Int.max
    
    var arr = Array(numbers).map{Int(String($0))!}
    //print(arr)
    
    func bfs(_ num: Int, _ hand: (Int,Int)) -> Int{
        var q: [(Int,Int)] = []
        var dis = Array(repeating: Array(repeating: Int.max, count: 3), count: 4)
        var target = numPad[num]
        q.append((hand.0, hand.1))
        dis[hand.0][hand.1] = 0
        var idx = 0
        var result = 0
        
        while q.count > idx {
            let now = q[idx]
            if now.0 == target.0 && now.1 == target.1 {
                result = dis[now.0][now.1]
                break
            }
            
            idx += 1
            
            for i in 0..<8 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                if (0..<4).contains(newY) && (0..<3).contains(newX) {
                    if i < 4 {
                        if dis[newY][newX] > dis[now.0][now.1] + 2 {
                            dis[newY][newX] = dis[now.0][now.1] + 2
                            q.append((newY, newX))
                        }
                    } else {
                        if dis[newY][newX] > dis[now.0][now.1] + 3 {
                            dis[newY][newX] = dis[now.0][now.1] + 3
                            q.append((newY, newX))
                        }
                    }
                }
                
            }
            
        }
        return result == 0 ? 1 : result
    }
    
    func dfs(_ arr: [Int], _ leftHand: (Int,Int), _ rightHand: (Int,Int), _ idx: Int, _ cost: Int) {
        if idx == numbers.length {
            //print("최종", cost)
            ans = min(ans, cost)
            return
        }
        
        for i in idx..<numbers.length {
            let now = arr[i]
            //print("숫자", now)
            let left = bfs(now, leftHand)
            let right = bfs(now, rightHand)
            //print(left, right)
            // 왼손으로 누름
            dfs(arr, numPad[now], rightHand, i+1, cost+left)
            dfs(arr, leftHand, numPad[now], i+1, cost+right)
            return
        }
    }
    
    dfs(arr, leftHand, rightHand, 0, 0)
    return ans
}
/*
1 2 3
4 5 6
7 8 9
  0

*/

```
