dfs로 풀이하면서 조합을 이용해 2개씩 묶는 경우의 수를 정해서 풀이해보았다.   
하지만 어딘가 잘못짠 로직이었다.   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var arr:[Int] = []
    var visited = Array(repeating: false, count: n)
    var list: [[Int]] = [[]]
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    print(arr)
    dfs(0)
    
    
    func dfs(_ sum: Int) {
        
        if check(visited) {
            print("최종 ",sum)
            return
        }
        
        // 그냥 더하거나 아무숫자와 곱해서 더하거나
        for i in 0..<n {
            if !visited[i] {
                // 그냥 더하기
                visited[i] = true
                dfs(sum+arr[i])
                visited[i] = false
                
                // 조합으로 2개 구하기
                visited[i] = true
                list.removeAll()
                combi(arr, 2, 0, [arr[i]])
                print(list, list.count)
                
                if list.count != 0 {
                    for l in list {
                        let value = l.reduce(1, *)
                        visited[l[0]] = true
                        visited[l[1]] = true
                        dfs(sum + value)
                        visited[l[0]] = false
                        visited[l[1]] = false
                    }
                }
                
                visited[i] = false
            }
        }
    }
    
    
    func combi(_ arr: [Int], _ targetNum: Int, _ idx: Int, _ returnArr: [Int]){
        
        if returnArr.count == targetNum {
            print(returnArr)
            list.append(returnArr)
            return
        }
        
        for i in idx..<n {
            if !visited[i] {
                combi(arr, targetNum, i+1, returnArr + [arr[i]])
            }
            
        }
        
        return
    }
    
    
    func check(_ visited: [Bool]) -> Bool {
        
        for i in 0..<n {
            if !visited[i] { return false }
        }
        
        return true
    }
}


solution()
/*
 */

```
