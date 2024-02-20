치킨집의 수는 최대 13개이다.   
따라서 13개의 치킨집에서 조합으로 m개의 조합식을 꺼낸다   
꺼낸 조합식의 치킨집을 기준으로   
존재하는 모든 집들에서부터 해당 조합식의 치킨집을 향한 치킨 거리를 구한다.   
해당 치킨 거리를 더하면 도시의 치킨거리가 된다.   
위와 같은 도시의 치킨거리를 계속해서 최솟값으로 찾아낸다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = [[Int]](repeating: [], count: n)
    var houses: [(Int,Int)] = []
    var stores: [(Int,Int)] = []
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = value
        for j in 0..<n {
            if value[j] == 1 { houses.append((i,j))}
            if value[j] == 2 { stores.append((i,j))}
        }
        
    }
//    print(board)
//    print(houses, stores)
    var result = Int.max
    func combi(_ idx: Int, _ arr: [(Int,Int)]) {
        if arr.count == m {
            //print(arr)
            result = min(result, checkDistance(arr))
            return
        }
        
        for i in idx..<stores.count {
            combi(i+1, arr + [stores[i]] )
        }
    }
    
    func checkDistance(_ arr: [(Int,Int)]) -> Int{
        var result = 0
        for house in houses {
            var distance = Int.max
            for store in arr {
                distance = min(distance, (abs(store.0-house.0) + abs(store.1-house.1)))
            }
            
            result += distance
        }
        
        return result
    }
    combi(0, [])
    print(result)
}
solution()

/*
 5 3
 0 0 1 0 0
 0 0 2 0 1
 0 1 2 0 0
 0 0 1 0 0
 0 0 0 0 2
 
 5 2
 0 2 0 1 0
 1 0 1 0 0
 0 0 0 0 0
 2 0 0 1 1
 2 2 0 1 2
 */


```
