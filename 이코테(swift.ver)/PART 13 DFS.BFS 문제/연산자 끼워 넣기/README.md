처음에는 수식이 최대 11개여서 순환으로 모든 경우의수를 따져가며 하려 했지만 시간초과   
따라서 조합처럼 해당 기호를 계산하고 dfs후 계산이 끝나면   
해당 기호를 다시 +1 하여 다음 계산에 사용할 수 있도록 구현   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let numList = readLine()!.split(separator: " ").map{Int($0)!}
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    var maxNum = Int.min
    var minNum = Int.max
    
    func dfs(_ sum: Int, _ depth: Int) {
        if depth == n {
            maxNum = max(maxNum, sum)
            minNum = min(minNum, sum)
            return
        }
        
        // 기호가 없는것을 빼고 반복문
        for (idx, value) in input.enumerated() where value != 0 {
            input[idx] -= 1
            var tempSum = sum
            switch idx {
            case 0:
            tempSum += numList[depth]
            case 1:
                tempSum -= numList[depth]
            case 2:
                tempSum *= numList[depth]
            case 3:
                tempSum /= numList[depth]
            default:
                break
            }
            dfs(tempSum, depth + 1)
            input[idx] += 1
        }
    }
    dfs(numList[0], 1)
    print(maxNum, minNum)
}
solution()

/*
6
1 2 3 4 5 6
2 1 1 1
 
3
3 4 5
1 0 1 0
 */


```
