p이거나 P이면 +1 y이거나 Y이면 -1을 해준다.   
만약 개수가 같아서 count가 0이라면 true를 반환해준다.   

```
import Foundation

func solution(_ s:String) -> Bool
{
    var count = 0
    for word in s {
        if word == "p" || word == "P" { count += 1 }
        else if word == "y" || word == "Y" { count -= 1}
    }
    return count == 0 ? true : false
}
```
