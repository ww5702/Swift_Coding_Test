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
너무 어렵게 생각했던거였다.   
쉽게 생각해서 음수는 제일 작은 값들을 서로 곱해주고,   
1은 그냥 더해주고   
양수는 가장 큰값들끼리 서로 곱해주는게 가장 크다.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var arr:[Int] = []
    var minusArr: [Int] = []
    var plustArr: [Int] = []
    
    for _ in 0..<n {
        let input = Int(readLine()!)!
        if input <= 0 { minusArr.append(input) }
        else if input == 1 { arr.append(input) }
        else { plustArr.append(input) }
    }
    
    var sum = 0
    minusArr.sort(by: <)
    plustArr.sort(by: >)
    
    var idx = 0
    while idx < minusArr.count {
        if idx+1 < minusArr.count {
            sum += minusArr[idx] * minusArr[idx+1]
        } else if idx+1 >= minusArr.count {
            sum += minusArr[idx]
        }
        idx += 2
    }
    
    idx = 0
    while idx < plustArr.count {
        if idx+1 < plustArr.count {
            sum += plustArr[idx] * plustArr[idx+1]
        } else if idx+1 >= plustArr.count {
            sum += plustArr[idx]
        }
        idx += 2
    }
    
    print(sum + arr.count)
    
}


solution()
/*
 */

```
