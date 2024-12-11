하나씩 적다보니 규칙은 발견할수있었다.   
만약 300대에서 감소하는 숫자를 찾으려면   
십의자리중에서도 2로 시작, 1로 시작하는 십의자리를 찾는다 21, 20, 10   
그리고 해당 숫자를 3에 집어넣는것이다. 321, 320, 310   
5라면   
543 542 541 532 531 530 521 520 510   
이 된다.   
하지만 dp처럼 갯수를 구하는것이 아닌, 해당 idx값을 찾는것이니   
하나하나 찾아가며 추가해줘야한다.   
먼저 0부터 9까지의 초기값을 저장해준다.   
그리고 뽑아낸값이 5라고 가정하고 해당값보다 큰값인 6부터 9까지의 숫자를 앞에 추가하여 배열에 추가해주면된다.   
65 75 85 95 와 같이   
해당과정을 1,000,000자리까지 하니 idx는 4까지만 조사한다.   
하지만 31프로 실패   
알고보니 1_000_000까지의 값이 아닌 1_000_000번째 감소하는 숫자까지 가능한것이었다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    if n <= 9 {
        print(n)
    } else {
        var arr: [[Int]] = [[0,1,2,3,4,5,6,7,8,9]]
        var idx = 0
        while idx <= 4 {
            var temp: [Int] = []
            for i in arr[idx] {
                let str = String(i)
                let num = Int(String(str[str.startIndex]))!
                
                // 해당 숫자 앞에 해당숫자보다 큰 값을 다 넣어준다고 생각하면 편하다.
                if num < 9 {
                    for j in num+1...9 {
                        //print(String(j) + String(i))
                        temp.append(Int(String(j)+String(i))!)
                    }
                }
            }
            //print(temp)
            arr.append(temp)
            idx += 1
        }
        let newArr = arr.flatMap({$0}).sorted(by: <)
        if n >= newArr.count {
            print(-1)
        } else {
            print(newArr[n])
        }
    }
}
solution()
/*
 0~9
 10
 21 20
 32 31 30
 43 42 41 40
 ...
 98 97 96 95 94 93 ... 90
 3자리수
 210
 321 320 310
 432 431 421 420 410
 543 542 541 540 532 531 530 521 520 510
 
 9876543210
 
 */

```
