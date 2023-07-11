첫 제출   
반으로 나눠서 for문을 진행하기에 500개원소를 반복한다고 시간초과가 나올것 같지는 않았다.   
따라서 /2 몫만큼 반복해서 append해주고, reversed()를 이용해 한번더 append를 시켜주었다.   
하지만 반복해서 string을 입력받는 부분의 시간을 줄일 수 있다면 좋을것 같다고 판단하였다.   
```
import Foundation

func solution(_ food:[Int]) -> String {
    var str = ""
    for i in 1..<food.count {
        let cnt = food[i]/2
        var word = ""
        for j in 0..<cnt {
            word.append(String(i))
        }
        str.append(word)
        //print(str)
    }
    var temp = str
    str.append("0")
    str.append(String(temp.reversed()))
    //print(str)
    return str
}
```
