풀이방법은 맞는것같으나 5,3,3,5,3 처럼 만들어질때   
강제로 탈출시키는 조건이 필요할거같다.   
```
import Foundation

func solution(_ a:[Int]) -> Int {
    /*
    스타 수열의 조건
    1. x의 길이가 2이상의 짝수
    2. x의 부분집합의 교집합이 1 이상이다
    3. 부분집합들끼리는 달라야한다
    예를 들어 1,2,1,3,4,1,1,3일때
    1,2 / 1,3 / 4,1 / 1,3
    수열의 길이가 8개이고 (1번)
    교집합이 1으로 1개 이상이고 (2번)
    부분집합들끼리 다르다 (3번)
    
    교집합이 있어야 하기에 가장 숫자가 많이 나온 수를 정해서
    해당 수 x 2 가 가능하면 해당수가 정답이다
    5,2,3,3,5,3에서 가장 많이 나온 수 3
    하지만 3을 뽑아낼때 어떻게 뽑아내도
    5,3,3,5,3 / 2,3,3,5,3 2의 배수도 불가, 2개씩 쪼갰을때 같은수가 나옴
    그 다음 5, 3을 2개씩 쓸때
    5,2,5,3 / 5,3,3,5 가 가능하다 따라서 4
    
    테스트케이스 3번
    0이 4개로 가장 많으므로 0 먼저 탐색한다
    0 나오고 0이 안나올때까지 순환 하다 나오면 입력 3
    다시 0이든 0이 아니든 넣고
    0이 아닌 숫자라면 0이 나올떄가지 순환 
    위와 같은 과정을 반복
    0,3,3,0,7,0,2,0 = 8개 가능
    */
    //var numList = Array(repeating: 0, count: 10)
    func maxFirst(_ num: Int, _ cnt: Int) -> Int{
        var arr: [Int] = []
        // 아무숫자나 들어가도 되는가? 
        var nextNum = ""
        for i in a {
            // 아직 max숫자가 안들어갔다면 max숫자가 들어갈때까지 순환
            if arr.isEmpty && i != num { continue }
            else if arr.isEmpty && i == num { 
                arr.append(i)
                nextNum = "notmax"
            }
            
            if arr.count % 2 == 0 {
                arr.append(i)
                if i == num { nextNum = "notmax" }
                else {nextNum = "max"}
            }
            
            if arr.count % 2 == 1 {
                if i == num && nextNum == "max" {
                    arr.append(i)
                    nextNum = "anything"
                }
                
                if i != num && nextNum == "notmax" {
                    arr.append(i)
                    nextNum = "anything"
                }
            }
        }
        print(arr)
        // 짝수일때만 return
        return arr.count % 2 == 0 ? arr.count : 0
    }
    func otherFirst(_ num: Int, _ cnt: Int) -> Int {
        var arr: [Int] = []
        // 아무숫자나 들어가도 되는가?
        var nextNum = ""
        for i in a {
            // 아직 숫자가 안들어갔다면 숫자가 들어갈때까지 순환
            if arr.isEmpty && i == num { continue }
            else if arr.isEmpty && i != num { 
                arr.append(i)
                nextNum = "max"
            }
            
            if arr.count % 2 == 0 {
                arr.append(i)
                if i == num { nextNum = "notmax" }
                else {nextNum = "max"}
            }
            
            if arr.count % 2 == 1 {
                if i == num && nextNum == "max" {
                    arr.append(i)
                    nextNum = "anything"
                }
                
                if i != num && nextNum == "notmax" {
                    arr.append(i)
                    nextNum = "anything"
                }
            }
        }
        print(arr)
        // 짝수일때만 return
        return arr.count % 2 == 0 ? arr.count : 0
    }
    
    var numList: [Int:Int] = [:]
    for num in a {
        let value = numList[num] ?? 0
        numList[num] = value+1;
    }
    var list = numList.sorted(by: {$0.1 > $1.1})
    var maxValue = list[0].value
    var result = 0
    while true {
        // 최대값부터 계산할거기에 결과값이 바뀐다면 return
        if result != 0 { break }
        // 2개도 만들지 못한 경우
        if maxValue == 0 { break }
        var checkNumList = list.filter{$0.1 >= maxValue}
        while !checkNumList.isEmpty {
            let num = checkNumList[0].key
            var cnt = maxValue
            print("현재 가장큰 숫자, 들어갈수있는 횟수",num,cnt)
            // 숫자를 넣는 경우는 2가지이다. 교집합 숫자를 먼저 넣거나
            // 교집합 숫자를 나중에 넣거나
            let value1 = maxFirst(num, cnt)
            let value2 = otherFirst(num, cnt)
            
            
            print("max먼저",value1)
            print("other먼저",value2)
            // 구한 숫자들이 더 클경우 result를 바꿔준다.
            let check = max(value1,value2)
            result = result < check ? check : result
            checkNumList.removeFirst()
        }
        maxValue -= 1
    }
    return -1
}
```
더 쉽게 풀이하는 방법이 있다.   
{1,2} / {4,1} 은 가능한 스타수열이다.   
즉 들어가야하는 숫자(1)이 앞이나 뒤에 존재하고   
앞이라면 뒤에 숫자가 뒤라면 앞의 숫자가 들어가야하는 숫자(1)과 다르면 해당 경우는 삽입이 가능하다.   
이렇게 value를 구해주고 해당값과 result를 비교하여 더 큰값을 남겨준뒤   
마지만 반환할때 x2를 하여 해당값을 return 해준다.   

또한 시간초과를 피하기 위해 result값보다 작은 key라면 continue로 반복문을 탈출시켜준다.   
