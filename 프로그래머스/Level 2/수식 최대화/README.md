연산자 * + - 세개의 수식이 우선순위에 따라 최대 6가지의 결과밖에 나오지 않으므로   
연산자에 따라 계산기를 돌리고 값을 저장해 최대값을 반환해준다.   
```
import Foundation
// 계산기 함수
func caculate(_ a: Int, _ b: Int, _ operate: String) -> Int {
    switch operate {
        case "*":
        return a * b
        case "+":
        return a + b
        case "-":
        return a - b
        default:
        return -1
    }
}
func solution(_ expression:String) -> Int64 {
    let number = expression.components(separatedBy:["-","+","*"])
    let operators = expression.split{$0.isNumber}.map{String($0)}
    
    // 잘못된 연산식은 존재하지 않으니 숫자 하나 연산자 하나씩 입력
    var list = [String]()
    for i in 0..<operators.count {
        list.append(number[i])
        list.append(operators[i])
    }
    // 남은 숫자 하나 입력
    list.append(number.last!)
    //print(list)
    
    // 6개밖에 없은 우선순위
    let priority = [("*","+","-"),("*","-","+"),("+","*","-"),("+","-","*"),("-","*","+"),("-","+","*")]
    
    // 연산 결과값 저장 배열
    var sumArray: [Int] = Array(repeating:0, count: 6)
    var copyList = list
    
    for i in 0..<priority.count {
        copyList = list
        // 현재 우선순위 순서 저장
        let first = priority[i].0
        let second = priority[i].1
        let third = priority[i].2
        // 예를들어 곱셈의 연산자가 사라질때까지 계산
        while copyList.contains(first) {
            let index = copyList.firstIndex(of: first)!
            // 계산기로 앞 뒤 숫자를 계산하여 해당 순서에 저장
            sumArray[i] = caculate(Int(copyList[index-1])!, Int(copyList[index+1])!, first)
            // 계산결과를 복사한 list에 저장후 계산에 사용한
            // 숫자 및 연산자 삭제 과정
            copyList.insert(String(sumArray[i]), at: index+2)
            copyList.remove(at: index-1)
            copyList.remove(at: index-1)
            copyList.remove(at: index-1)
        }
        //print(copyList)
        // 우선순위 두번째 연산자 계산 과정
        while copyList.contains(second) {
            let index = copyList.firstIndex(of: second)!
            sumArray[i] = caculate(Int(copyList[index-1])!, Int(copyList[index+1])!, second)
            copyList.insert(String(sumArray[i]), at:index+2)
            copyList.remove(at: index-1)
            copyList.remove(at: index-1)
            copyList.remove(at: index-1)
        }
        //print(copyList)
        // 우선순위 세번째 연산자 계산 과정
        while copyList.contains(third) {
            let index = copyList.firstIndex(of: third)!
            sumArray[i] = caculate(Int(copyList[index-1])!, Int(copyList[index+1])!, third)
            copyList.insert(String(sumArray[i]), at:index+2)
            copyList.remove(at: index-1)
            copyList.remove(at: index-1)
            copyList.remove(at: index-1)
        }
        //print(copyList)
        
    }
    //print(sumArray)
    var result = 0
    for i in sumArray {
        result = result < abs(i) ? abs(i) : result
    }
    //print(result)
    
    return Int64(result)
}
```
  
