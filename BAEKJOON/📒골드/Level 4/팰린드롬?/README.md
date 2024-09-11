당연히 이진트리로 풀이하면 시간초과가 발생할줄 알았다.    

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    var m = Int(readLine()!)!
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        var (start,end) = (input[0],input[1])
        if (end - start) % 2 == 1 { print(0) }
        else {
            while(start != end) {
                if value[start-1] == value[end-1] {
                    start += 1
                    end -= 1
                } else {
                    break
                }
            }
            print(start == end ? 1 : 0)
        }
    }
}

solution()
/*
 */
```
dp를 이용해 O(n^2)로 풀이했으나 시간초과   
밑의 방법은 0 2, 1 3, 2 4, 3 5 까지의 범위를 구할때   
0번째 글자와 2번째 글자가 같고 그 안의 1부터 1까지가 팰린드롬이면 0부터 2까지도 팰린드롬   
이렇게 순회를 돌고   
0 3, 1 4, 2 5 등등 한칸씩 늘린다   
그리고 0번째 글자와 3번째 글자가 같고, 1부터 2사이의 범위를 dp에서 확인해봤을때 팰린드롬이 형성되어있다면   
0부터 3까지의 범위도 팰린드롬   
근데 시간초과   
따라서 O(n)의 방법을 찾아야 할 것 같다.   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    var m = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for i in 0..<n {
        dp[i][i] = true
    }
    
    
    for k in 2...n-1 {
        for i in 0..<n-k {
            let j = i + k
            //print(i,j)
            if value[i] == value[j] && dp[i+1][j-1] {
                dp[i][j] = true
            }
        }
    }
    
//    for i in 0..<n {
//        print(dp[i])
//    }
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        print(dp[input[0]-1][input[1]-1] ? 1 : 0)
    }
}

solution()
/*
 */


```
가 아니라   
FIO를 이용해 빠르게 입력받으면 해결되는 문제이다^^
```
let file = FileIO()
    let N = file.readInt()
    var arr: [Int] = [-1]
    for _ in 0..<N {
        arr.append(file.readInt())
    }
    let M = file.readInt()
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
    
    for i in 1...N {
        dp[i][i] = true // 1자리수는 무조건 팰린드롬.
    }
    
    
    for i in 1..<N {
        if arr[i] == arr[i + 1] { // dp공식을 위해 미리 체크해놓음.
            dp[i][i + 1] = true
        }
    }
    
    for i in stride(from: N-2, through: 1, by: -1) {
        for j in i+2...N { // i와 i+1은 미리 세팅됨.
            if (dp[i + 1][j - 1]) && (arr[i] == arr[j]) {
                dp[i][j] = true
            }
        }
    }
    
    var answer = ""
    for _ in 0..<M {
        let (S, E) = (file.readInt(), file.readInt())
        answer += (dp[S][E] == true ? "1\n" : "0\n")
    }
    print(answer)
```
