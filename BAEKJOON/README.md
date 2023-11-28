백준은 입출력이 필요하다.   
```
한글자씩 입력
let N = Int(readLine()!)!

입력한 값을 띄어쓰기를 기준으로 나누어 Int배열로 저장
var input = [Int](readLine()!.split(separator:" ").map{Int($0)!})
```
