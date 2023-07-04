첫 제출   
원하는 값으로 정렬을 한 후   
mod값을 구해준 뒤   
^ 연산자를 이용하면 끝인줄 알았다.   

```
import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var data = data.sorted{$0[col-1] == $1[col-1] ? $0[0] > $1[0] : $0[col-1] < $1[col-1]}
    //print(data)
    //print(data[row_begin-1])
    var a = 0
    for i in data[row_begin-1] {
        a += (i%row_begin)
    }
    //print(a)
    //print(data[row_end-1])
    var b = 0
    for i in data[row_end-1] {
        b += (i%row_end)
    }
    //print(b)
    
    return a^b
}
```
두번쨰 제출   
풀이 과정은 맞았으나   
mod 해주는 과정이 틀린것이었다.   

```
import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var data = data.sorted{$0[col-1] == $1[col-1] ? $0[0] > $1[0] : $0[col-1] < $1[col-1]}
    var arr: [Int] = []
    for i in row_begin-1...row_end-1 {
        var sum: Int = 0
        for n in data[i] {
            sum += n%(i+1)
        }
        arr.append(sum)
    }
    
    return arr.reduce(0,^)
}
```
