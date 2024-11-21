이 또한 문제를 이해하기 어려웠다.   
알파벳 하나를 아무거나 집어넣을지 / 연속된 단어를 복사할지 선택하는문제이다.   
daldidalgo daldidan 즉 n이 2라면   
d   
a   
l   
d   
i   
까지는 한글자씩 넣을수밖에없고   
dal은 위에 입력한 단어중 연속된 부분이 있으므로 한번에   
g   
o   
여기까지 8초   
daldida    
n   
여기까지 2초   
그래서 10초가 경과된다.   
그렇다면 n이 4라면 어떻게 될까   
daldidalgo daldidalgo daldidalgo daldidalgo daldidan   
이다.   
여기서 daldidan은 빼두고 생각해보자   
daldidalgo daldidalgo daldidalgo daldidalgo   
에서 한단계전은   
daldidalgo daldidalgo이다.   
+1초   
그리고 한단계 전은    
daldidalgo이다.   
+1초   
그리고 이렇게 하나가 남고 아까 빼둔 daldidan까지 합치면 10초   
즉 12초이다.   
따라서 n이 1이 될때까지 /2를 진행하며 시간초를 제고,   
그 값에서 +10초를 더 해준다.   


```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var cnt = 0
    while n > 1 {
        n /= 2
        cnt += 1
    }
    print(cnt+10)
}
solution()

```
