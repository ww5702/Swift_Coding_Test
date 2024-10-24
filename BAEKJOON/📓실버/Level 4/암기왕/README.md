시간초과   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n1 = Int(readLine()!)!
        let note1 = readLine()!.split(separator: " ").map{Int(String($0))!}
        var dict: [Int:Int] = [:]
        for n in note1 {
            dict[n] = 1
        }
        //print(dict)
        
        let n2 = Int(readLine()!)!
        let note2 = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        for i in 0..<n2 {
            print(dict[note2[i]] ?? 0)
        }
    }
}

solution()
/*
 */

```
Set을 이용해 시간복잡도를 줄여준다.   
note1에 여러 중복된 숫자가 있기 때문   
Set로 풀이하거나 FileIO를 사용해야 풀린다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n1 = Int(readLine()!)!
        let note1 = Set(readLine()!.split(separator: " ").map{Int(String($0))!})
        
        let n2 = Int(readLine()!)!
        let note2 = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        for i in 0..<n2 {
            print(note1.contains(note2[i]) ? "1" : "0")
        }
    }
}

solution()
/*
 */

```
