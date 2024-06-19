당연히 부분 정렬로 문제를 풀면 시간초과가 발생할것같아   
dequeue비슷하게 풀이해봤지만 3프로에서 실패   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,l) = (input[0],input[1])
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result: [Int] = []
    var q: [(Int,Int)] = []
    for i in 0..<n {
        //print(q, arr[i])
        while q.count != 0 && q.last!.1 > arr[i]  {
            q.removeLast()
        }
        q.append((i+1, arr[i]))
        //print(q, arr[i])
        if (i+1) - q[0].0 >= l {
            q.reverse()
            q.removeLast()
            q.reverse()
        }
        //print(q, arr[i])
        result.append(q[0].1)
        //print(result)
    }
    print(result.map{String($0)}.joined(separator: " "))
    
}

solution()
/*
 */

```
맞춘방법을 보았으나   
결국 입력을 fileIO로 받고,   
[dequeu](https://github.com/ww5702/Swift_Coding_Test/blob/main/Algorithm/%ED%81%90(Queue)&%EB%8D%B1(Deque).md)를 따로 구현하여 풀이하였다.   
즉 풀이방법은 맞았으나 swift에게는 가혹한 문제였다.   
