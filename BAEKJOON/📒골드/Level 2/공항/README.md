dict가 시간이 제일 적게 걸릴것같아 풀이했지만 28%에서 시간초과   

```
import Foundation
func solution(){
    let g = Int(readLine()!)!
    var dict: [Int:Int] = [:]
    let p = Int(readLine()!)!
    for _ in 0..<p {
        let num = Int(readLine()!)!
        //print(num)
        let temp = dict.count
        for i in stride(from: num, through: 1, by: -1) {
            if dict[i] == nil {
                //print("추가",i)
                dict[i] = 1
                break
            }
            
        }
        if dict.count <= temp { break }
    }
    //print(dict)
    print(dict.count)
}

solution()
/*
 */


```
union-find가 가장 적은 시간으로 연결할 수 있다.   
쉽게 생각해서 뒤에서부터 작아지므로 union-find를 할 수 있다.   
3이 값이라면 3번 게이트는 꽉차게 되고 2번을 가르켜야한다.   
따라서 3과 2를 유니온하는것이다.   
만약 다음에 3을 또 가르킨다면 3은 2를 가르키고 2는 아직 가능하기에   
2에 넣는다 생각하며 2를 1로 가르킨다.   

```
import Foundation
func solution(){
    let g = Int(readLine()!)!
    let p = Int(readLine()!)!
    var parent = Array(1...g)
    parent.insert(0, at: 0)
    var cnt = 0
    
    func find(_ x: Int) -> Int {
        if parent[x] == x {return x}
        parent[x] = find(parent[x])
        return parent[x]
    }
    func union(_ x: Int, _ y: Int) {
        parent[find(y)] = find(x)
    }
    
    for _ in 0..<p {
        let num = Int(readLine()!)!
        if find(num) == 0 { break }
        cnt += 1
        union(find(num)-1, find(num))
    }
    print(cnt)
}

solution()
/*
 */


```
