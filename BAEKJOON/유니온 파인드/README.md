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
## 4195 별자리 만들기
기존의 parent를 string:string으로 바꿔준뒤   
연결된 친구를 셀 cnt 또한 String:Int 로 만들어준다.   
친구가 두명 나오는데 전부 왼쪽 친구를 기준으로 union시켜준다고 가정하고   
합쳐질때마다 왼쪽친구에게 + 오른쪽친구의 cnt 값을 더해준다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        func find(_ x: String) -> String {
            if parent[x] == x { return x }
            else {
                parent[x] = find(parent[x]!)
                return parent[x]!
            }
        }
        func union(_ a: String, _ b: String) {
            let a = find(a)
            let b = find(b)
            if (a != b) {
                parent[b] = a
                cnt[a]! += cnt[b]!
            }
        }
        let f = Int(readLine()!)!
        var parent = [String:String]()
        var cnt = [String:Int]()
        for _ in 0..<f {
            let input = readLine()!.split(separator: " ").map{String($0)}
            if !parent.keys.contains(input[0]) {
                parent[input[0]] = input[0]
                cnt[input[0]] = 1
            }
            if !parent.keys.contains(input[1]) {
                parent[input[1]] = input[1]
                cnt[input[1]] = 1
            }
            union(input[0],input[1])
            print(cnt[find(input[0])]!)
        }
    }
    
    
    
}
solution()

```
## 20040 사이클 게임
union을 진행하다가   
만약 parent[a], parent[b]가 같은 순간이 있다면   
해당 순간이 사이클이 형성되는 순간이다.   

```
import Foundation
func solution(){
    var isCycle = false
    
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
        } else {
            isCycle = true
        }
    }
    
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var parent = [Int](0...n)
    
    for i in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let left = input[0]
        let right = input[1]
        
        union(left,right)
        if isCycle {
            print(i+1)
            break
        }
    }
    if !isCycle { print(0) }
}
solution()

```
## 4386 별자리 만들기
좌표라고 어렵게 생각하지말고 3가지 좌표가 있다면 순서를 Int로 생각해   
해당 별에서부터 나머지별까지의 값을 저장해준다고 생각하면 편하다.    
그리고 해당 거리들중 가장 작은 거리들을 우선적으로 선택해 간선을 이어준다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
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
    
    var parent = [Int](0...n)
    var stars: [(Double,Double)] = []
    var distanceStar: [(Int,Int,Double)] = []
    var result: Double = 0.0
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Double($0)!}
        stars.append((input[0],input[1]))
    }
    for i in 0..<n {
        for j in i+1..<n {
            //print(stars[i],stars[j])
            let x = pow((stars[i].0 - stars[j].0),2)
            let y = pow((stars[i].1 - stars[j].1),2)
            distanceStar.append((i,j,sqrt(x+y)))
        }
    }
    //print(distanceStar)
    distanceStar.sort{$0.2 < $1.2}
    var line = 0
    for i in 0..<distanceStar.count {
        if line == n-1 { break }
        if find(distanceStar[i].0) != find(distanceStar[i].1) {
            result += distanceStar[i].2
            line += 1
            union(distanceStar[i].0, distanceStar[i].1)
        }
        
    }
    print(round(result*100)/100)
}
solution()

```
## 1774 우주신과의 교감
이미 연결되어있는 간선이 존재한다는 것 빼고는 전부 같은 방식의 문제이다.   
그리고 출력시 4.0을 4.00으로 해야한다는 점이 좀 다르다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    
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
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    var parent = [Int](0...n)
    var gods: [(Int,Int)] = []
    var distanceGods: [(Int,Int,Double)] = []
    var result: Double = 0.0
    var line = 0
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        gods.append((input[0],input[1]))
    }
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        union(input[0], input[1])
        line += 1
    }
    for i in 0..<gods.count-1 {
        for j in i+1..<gods.count {
            //print(stars[i],stars[j])
            let x = pow((Double(gods[i].0) - Double(gods[j].0)),2)
            let y = pow((Double(gods[i].1) - Double(gods[j].1)),2)
            distanceGods.append((i,j,sqrt(x+y)))
        }
    }
    //print(distanceGods)
    distanceGods.sort{$0.2 < $1.2}

    for i in 0..<distanceGods.count {
        if line == n-1 { break }
        if find(distanceGods[i].0) != find(distanceGods[i].1) {
            result += distanceGods[i].2
            line += 1
            union(distanceGods[i].0, distanceGods[i].1)
        }
        
    }
    print(String(format: "%.2f", result))
}
solution()

```
