이동에는 1의 시간이 들고 스위치를 누르는데에는 0의 시간이 든다.   
순간이동에는 2의 비용이 들고 옆방으로 이동하는데에는 1의 비용이 든다.   
가장 적은 시간으로 전부 방문하면서, 적은 시간들 중에서 적은 비용으로 방문하는 법을 구하는 문제이다.   
   
5까지일때 1 -> 5 와 같이 서로 양쪽이면 순간이동 없이 옆으로 이동만 하여   
비용이 0이 든다.   
하지만 n이 6이고, 3 -> 5일때라면   
3,4를 방문   
4에서 1로 순간이동 / 4에서 6으로 순간이동 선택지가 있을때   
start가 end보다 작으면 1로 이동, end가 더 작으면 6으로 이동한다.   
1,2를 밟고,   
1에서 6으로 이동   
6,5를 누른다.   
따라서 비용은 순간이동 2번으로 2가 발생한다.   
같은 방을 2번 밟지 않는 방법이라고 생각하여   
정답은 0,1,2 셋중 하나라고 생각했으나 6%에서 실패   


```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (n,s,e) = (input[0],input[1],input[2])
        var cost = 0
        if (s == 1 || s == n) && (e == 1 || e == n ) {
            print(0)
        } else {
            var cnt = 0
            if (s < e) {
                cnt += (e-s)
                
                // 순간이동
                if (s - 1 > 1) {
                    cnt += (s-1)
                    cost += 1
                }
                
                if (cost == n) { break }
                
                // 뒤로 순간이동
                cnt += (n-e+1)
                cost += 1
                
            } else {
                cnt += (s-e)
                
                // 뒤로 순간이동
                if (s + 1 > n) {
                    cnt += (n-s)
                    cost += 1
                }
                if (cost == n) { break }
                
                // 앞로 순간이동
                cnt += e
                cost += 1
            }
            
            print(cost)
        }
    }
    
}
solution()

```
