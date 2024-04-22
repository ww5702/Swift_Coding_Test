dfs로 백트래킹을 사용하여 풀이하면 시간초과가 발생한다.   
따라서 dp로 풀이해야한다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var info: [(Int,Int,Int,Int)] = []
    var num = 1
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map({Int($0)!})
        info.append((Int(sqrt(Double(input[0]))), input[1], input[2], num))
        num += 1
    }
    
    var maxCnt = 0
    var result: [Int] = []
    
    info.sort(by: {$0.2 > $1.2})
    //print(info)
    
    func dfs(_ idx: Int, _ width: Int, _ arr: [Int], _ sum: Int) {
        if idx == n {
            if maxCnt < sum {
                maxCnt = sum
                result = arr.reversed()
            }
            return
        }
        
        for i in idx..<n {
            if arr.isEmpty {
                dfs(i+1, info[i].0, arr+[info[i].3], sum + info[i].1)
                dfs(i+1, width, arr, sum)
            } else {
                // 4번 규칙 밑면이 더 좁아져야 쌓을 수 있다.
                if info[i].0 < width {
                    dfs(i+1, info[i].0, arr+[info[i].3], sum + info[i].1)
                    dfs(i+1, width, arr, sum)
                }
            }
            
        }
    }
    
    dfs(0, 0, [], 0)
    print(result.count)
    for i in 0..<result.count {
        print(result[i])
    }
}
solution()

```
dp로 가장 높이 쌓았을때를 정한다음   
쌓았던 높이를 빼주면서 값을 찾아온다.   
```
import Foundation
func solution(){
    struct Block {
        let id: Int
        let area: Int
        let height: Int
        let weight: Int
    }

    let n = Int(readLine()!)!

    var blockList = [Block(id: 0, area: 0, height: 0, weight: 0)]

    for i in 1...n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (area, height, weight) = (input[0], input[1], input[2])
        
        blockList.append(Block(id: i, area: area, height: height, weight: weight))
    }

    blockList.sort { b1, b2 in
        return b1.weight < b2.weight
    }

    var dp = Array(repeating: 0, count: n+1)

    for i in 1..<n+1 {
        for j in 0..<i {
            if blockList[i].area > blockList[j].area {
                dp[i] = max(dp[i], dp[j] + blockList[i].height)
            }
        }
    }
    print(dp)

    var maxHeight = dp.max()!
    var index = dp.firstIndex(of: maxHeight)!

    var result = [Int]()

    while index != 0 {
        if maxHeight == dp[index] {
            result.append(blockList[index].id)
            maxHeight -= blockList[index].height
        }
        index -= 1
    }

    print(result.count)
    result.reversed().forEach { num in
        print(num)
    }
}
solution()

```
