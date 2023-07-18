첫 제출   
mbti를 딕셔너리 배열에 저장한다음   
조건에 따라 점수를 매겨준다.   
조건문을 전부 돈 뒤 mbti 두개당 하나씩 비교하여 결과문장에 append해준다.   
```
import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var choices = choices
    var mbti: [String:Int] = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0,]
    for i in 0..<survey.count {
        var value = survey[i].map{String($0)}
        let check1Value = mbti[value[0]]!
        let check2Value = mbti[value[1]]!
        //print(check1Value, check2Value)
        
        // 확인
        if choices[i] < 4 {
            mbti[value[0]] = check1Value + abs(choices[i]-4)
        } else if choices[i] > 4 {
            mbti[value[1]] = check2Value + choices[i]-4
        }
        
        //print(mbti)
    }
    var answer = ""
    answer.append(mbti["R"]! >= mbti["T"]! ? "R" : "T")
    answer.append(mbti["C"]! >= mbti["F"]! ? "C" : "F")
    answer.append(mbti["J"]! >= mbti["M"]! ? "J" : "M")
    answer.append(mbti["A"]! >= mbti["N"]! ? "A" : "N")
    //print(answer)
    return answer
}
```
