구현 문제로 풀이했다.   
/2까지 순환하면서 다르다면 1번의 기회가 있다   
앞 글자를 지울지, 뒷 글자를 지울지   
따라서 두 방법으로 함수를 돌려 한번 더 확인해본다.   
해당 경우에도 틀리다면 2, 하나 지워서 성공하면 1, 애초에 회문이면 0이다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let str = readLine()!.map{String($0)}
        //print(str)
        var numZero = true
        var numOne = false
        
        func check(word: [String]) -> Bool{
            //print("달라서 옴")
            //print(word)
            for i in 0..<word.count/2 {
                if word[i] != word[word.count-i-1] {
                    return false
                }
            }
            
            return true
        }
        
        for i in 0..<str.count/2 {
            //print(str[i], str[str.count-i-1])
            if str[i] != str[str.count-i-1] {
                numZero = false
                // 앞글자를 지울지
                numOne = check(word: Array(str[i+1...str.count-i-1]))
                if numOne { break }
                // 뒷글자를 지울지
                
                numOne = check(word: Array(str[i...str.count-i-2]))
                break
            }
            
        }
        
        if numZero {
            print("0")
        } else {
            if numOne {
                print("1")
            } else {
                print("2")
            }
        }
    }
}

solution()
/*
 */


```
