# 유니온 파인드(또는 disjoint set, 상호 배타적 집합, ...) 자료구조를 배워 봅시다.	
이미 한번 풀이해본 적이 있다.   
   
[표 병합](https://github.com/ww5702/Swift_Coding_Test/tree/main/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4/Level%203/%ED%91%9C%20%EB%B3%91%ED%95%A9)   
   
## 1717 집합의 표현
유니온 파인드의 기초를 묻는 문제이다.   
유니온을 통해 해당 숫자가 가르키는 부모숫자를 설정해주고   
파인드를 통해 해당 숫자의 부모 숫자를 반환한다.   

```
import Foundation
func solution(){
    
    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a != b) {
            parent[b] = a
        }
    }
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var parent = [Int](0...n)
    for _ in 0..<m {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        let (cmd, a, b) = (value[0], value[1], value[2])
        
        if cmd == 0 {
            union(a,b)
        } else {
            if find(a) == find(b) {
                print("YES")
            } else {
                print("NO")
            }
        }
        
    }
}
solution()

```
## 1976 여행가자
갈수있는지 없는지 확인하는 문제이다.   
물론 bfs,dfs가 효율도 좋고 빠르지만   
유니온 파인드로도 풀수 있는지 없는지 확인해보라는 문제이다.   
그리고 물론 도시가 200개 이하라서 가능했다.   

```
import Foundation
func solution(){
    
    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a != b) {
            parent[b] = a
        }
    }
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var parent = [Int](0...n)
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<n {
            if value[j] == 0 { continue }
            else {
                union(i+1, j+1)
            }
        }
    }
    //print(parent)
    let plan = readLine()!.split(separator: " ").map{Int($0)!}
    var check = find(plan[0])
    var isPossible = true
    for i in 1..<plan.count {
        if check != find(plan[i]) {
            isPossible = false
            break
        }
    }
    print(isPossible ? "YES" : "NO")
}
solution()

```
