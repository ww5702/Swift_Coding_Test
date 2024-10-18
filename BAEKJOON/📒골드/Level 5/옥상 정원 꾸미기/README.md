stack으로 쉽게 풀이할 수 있다.   
볼 수 있는 층을 고르는게 아니라 보이는 층을 계산하는것이다.   
층을 넣다가 만약 stack의 마지막보다 더 큰 층이 온다면   
다음층부터는 관찰을 못할 stack들을 빼준다.   
10을 넣고 3을 넣고 7을 넣을때 3은 더이상 다음층을 볼 수 없기에  
3을 빼면서 남아있는 stack의 수를 세준다.   
해당 stack의 수가 현재 층을 볼 수 있는 층들의 합이다.   

   
10 과 7이 남는다.   
10 7 4 가 들어가고 12가 들어갈때   
10 7 4는 더이상 다음층을 볼 수 없다   
따라서 4는 10과 7이 관찰이 가능하고   
7은 10이 관찰이 가능하다.   
12와 2가 들어오고   
for문은 종료가 된다.   
하지만 stack이 남아있으므로 해당 예외경우를 계산해준다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var stack: [Int] = []
    var result = 0
    
    for i in 0..<n {
        let now = Int(readLine()!)!
        
        if stack.isEmpty {
            stack.append(now)
        } else {
            if stack.last! > now {
                stack.append(now)
            } else {
                while stack.last! <= now {
                    stack.removeLast()
                    result += stack.count
                    if stack.isEmpty { break }
                }
                stack.append(now)
            }
            
        }
        
        if i == n-1 && stack.count > 1 {
            for _ in 0..<stack.count-1 {
                stack.removeLast()
                result += stack.count
            }
        }
    }
    print(result)
}

solution()
/*
 6
 10
 3
 7
 4
 12
 2
 */


```
