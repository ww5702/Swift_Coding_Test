말이 4개밖에 없어 dfs로도 충분히 풀이가 가능한 문제였다.   
다만 말이 지름길로 갈수잇으면 무조건 지름길로 간다는 조건이 있어   
idx[s].last!가 기본적으로 가야하는 곳이다.   
또한 idx가 32부터 5칸은 뒤로 갈수 있다는 점도 주의해야할 사항이다.   

```
import Foundation
func solution(){
    let board = readLine()!.split(separator: " ").map{Int(String($0))!}
    let idx = [[1],[2],[3],[4],[5],[6,21],[7],[8],[9],[10],[11,27],[12],[13],[14],[15],[16,29],[17],[18],[19],[20],[32],[22],[23],[24],[25],[26],[20],[28],[24],[30],[31],[24],[32],[32],[32],[32],[32]]
    let score = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,13,16,19,25,30,35,22,24,28,27,26,0]
    
    //print(idx.count, score.count)
    var answer = -1
    var mal = [0,0,0,0]
    
    func dfs(_ n: Int, _ sum: Int) {
        //print(mal)
        if n == 10 {
            answer = max(answer, sum)
            return
        }
        
        for i in 0..<4 {
            let s = mal[i]
            var c = idx[s].last!
            for _ in 1..<board[n] {
                c = idx[c].first!
            }
            
            if c == 32 || !mal.contains(c) {
                mal[i] = c
                dfs(n+1, sum+score[c])
                mal[i] = s
            }
            
        }
    }
    dfs(0, 0)
    print(answer)
}
solution()
/*
 1 2 3 4 1 2 3 4 1 2
 2 6
 
 */

```
