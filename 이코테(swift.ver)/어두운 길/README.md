union-find를 통해 0을 가르킨다면 break해주는 문제이다.   
현재 입력받는 게이트는 1~input 게이트까지 가능하다는 소리이다.   
따라서 가장 많은 비행기를 도킹하기 위해 가장 큰 값을 기준으로 union-find를 진행한다.   
예시1을 기준으로 0 1 2 3 4 게이트가 있을때   
1번 비행기 4   
0 1 2 3 3   
2번 비행기 1   
0 0 2 3 3   
3번 비행기 1   
find(1)이 0이므로 break   
   
예시 2의 게이트 0 1 2 3 4   
1번 비행기 2   
0 1 1 3 4   
2번 비행기 2   
0 0 1 3 4   
3번 비행기 3   
0 0 0 0 4   
4번 비행기 3 실패   
   
위의 구조로 진행된다.   

```
import Foundation
func solution(){
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        } else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a < b) {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    let g = Int(readLine()!)!
    let p = Int(readLine()!)!
    var cnt = 0
    var parent = [Int](0...g)
    for _ in 0..<p {
        let input = Int(readLine()!)!
        if find(input) == 0 { break }
        union(find(input), find(input)-1)
        print(parent)
        cnt += 1
        
    }
    print(cnt)
}
solution()

```
