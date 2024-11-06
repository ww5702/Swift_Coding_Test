플로이드워셜을 통해 i , k , j일때의 서로 이해관계를 정리한다.   
그후 1번부터 돌면서 [1][2]가 true이면 1이 2보다 큰거다   
[2][1]가 true면 2가 1보다 큰거다.   
이렇게 크다고 정의된것만 골라서 short,tall로 구해둔다.   
그리고 short+tall이 n-1이라면 정확하게 본인 위치를 알 수 있다.   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var graph = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph[input[0]][input[1]] = true
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                // 만약 i,k 이고 k,j로 키 순서를 알면 i,j도 알 수 있다.
                if graph[i][k] && graph[k][j] {
                    graph[i][j] = true
                }
            }
        }
    }
    
    var result = 0
    for i in 1...n {
        //print(i)
        var (short, tall) = (0,0)
        for j in 1...n {
            if i == j { continue }
            if graph[i][j] { tall += 1}
            else if graph[j][i] { short += 1}
        }
        //print(short,tall)
        if short+tall == n-1 { result += 1}
    }
    
    print(result)
}

solution()
/*
 */
  

```
