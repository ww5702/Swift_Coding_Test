정렬 문법을 통해 풀이   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var student: [(String, Int, Int, Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        let (name, kr, eng, math) = (input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!)
        student.append((name,kr,eng,math))
    }
    //print(student)
    student.sort(by: {$0.1 == $1.1 ? $0.2 == $1.2 ? $0.3 == $1.3 ?
        $0.0 < $1.0 :
        $0.3 > $1.3 :
        $0.2 < $1.2 :
        $0.1 > $1.1})
    for s in student {
        print(s.0)
    }
}
solution()

/*
 12
 Junkyu 50 60 100
 Sangkeun 80 60 50
 Sunyoung 80 70 100
 Soong 50 60 90
 Haebin 50 60 100
 Kangsoo 60 80 100
 Donghyuk 80 60 100
 Sei 70 70 70
 Wonseob 70 70 90
 Sanghyun 70 70 80
 nsj 80 80 80
 Taewhan 50 60 90
 */


```
