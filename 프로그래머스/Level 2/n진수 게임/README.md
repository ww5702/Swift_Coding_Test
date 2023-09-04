swift에는 String(value, radix: 16)과 같은 진수 변환기가 있어 풀이하기 쉽다.   
```
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var result = ""
    var (num,sum) = (0,0)
    var nowSpeaking: Int = 1
    // result가 t개수와 같아질때까지 반복
    while result.count < t {
        let number = String(num, radix:n, uppercase:true)
        print(number)
        for i in number {
            // 만약 말할 순서라면 input
            if nowSpeaking == p { result += String(i) }
            
            // 끝까지 갔다면 다시 첫번째 순서로
            if nowSpeaking == m { nowSpeaking = 0 }
            
            // t개 구했다면 break
            if result.count == t { break }
            
            // 다음 순서로
            nowSpeaking += 1
        }
        // 다음 숫자
        num += 1
    }
    //print(result)
    
    return result
}
```
