import Foundation

func solution() {
    let INF = 987654321
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (nm[0],nm[1])
    var graph = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)
    
    
    // 자기 자신에게 가는 거리 0
    for i in 0..<n+1 {
        for j in 0..<n+1 {
            if i == j {
                graph[i][j] = 0
            }
        }
    }
    
    // 간선 정보를 받아 초기화
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b) = (input[0],input[1])
        graph[a][b] = 1
        graph[b][a] = 1
    }
    // 3중for문으로 플루이드 워셜 알고리즘 수행
    for k in 1..<n+1 {
        for a in 1..<n+1 {
            for b in 1..<n+1 {
                graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
            }
        }
    }
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (x,k) = (input[0],input[1])
    let distance = graph[1][k] + graph[k][x]
    if distance == 987654321 { print("-1") }
    else { print(distance) }
    
}
solution()
