```
/*
길이가 1인 모든단어를 포함하도록 사전 초기화
사전에 현재 입력과 일치하는 가장 긴 문자열 찾기
그 문자열에 해당하는 사전의 색인 번호를 출력하고 문자열 제거
입력에서 처리되지않은 다음글자가 있다면 a+b에 해당하는 단어를 사전에 등록
다시 긴 문자열 찾기
*/

/*
사전은 A~Z(1~26)까지가 초기로 등록
예를 들어 KAKAO라면 K는 등록되어있으나 KA까지는 없으므로 K의 11 출력, KA를 27번으로 등록
두번째글자 A = 1, AK는 없으므로 28번
KA는 이미 있으므로 27출력, KAO 29번으로 등록
O 15번 출력
*/

func solution(_ msg:String) -> [Int] {
    var dict: [String:Int] = [:]
    var msg = msg.map{String($0)}
    // 사전 초기화
    for i in 1...26 {
        dict[String(UnicodeScalar(65+(i-1))!)] = i
    }
    print(dict)
    var result: [Int] = []
    // 배열이 빌때까지
    while !msg.isEmpty {
        var start = 0
        var end = 0
        var result = ""
        for i in 0..<msg.count {
            //print(msg[start...end].joined())
            let condition: ((String,Int)) -> Bool = {$0.0.contains(msg[start...end].joined())}
            // 만약 없는 단어라면 단어 추가
            if dict.contains(where: condition) == false {
                let word = msg[start...end].joined()
                dict[word] = dict.count + 1
                print("추가된 단어",word)
                break 
            }
            // 있는 단어라면 한글자 뒤로
            if end+1 == msg.count {
                break
            } else {
                end += 1
            }
        }
        print(start,end)
        //print("없어져야할 단어", msg[start...end-1])
        msg.removeSubrange(start..<end)
        if msg.isEmpty { break }
    }
    
    return []
}
```

```
/*
길이가 1인 모든단어를 포함하도록 사전 초기화
사전에 현재 입력과 일치하는 가장 긴 문자열 찾기
그 문자열에 해당하는 사전의 색인 번호를 출력하고 문자열 제거
입력에서 처리되지않은 다음글자가 있다면 a+b에 해당하는 단어를 사전에 등록
다시 긴 문자열 찾기
*/

/*
사전은 A~Z(1~26)까지가 초기로 등록
예를 들어 KAKAO라면 K는 등록되어있으나 KA까지는 없으므로 K의 11 출력, KA를 27번으로 등록
두번째글자 A = 1, AK는 없으므로 28번
KA는 이미 있으므로 27출력, KAO 29번으로 등록
O 15번 출력
*/

func solution(_ msg:String) -> [Int] {
    var dict: [String:Int] = [:]
    var msg = msg.map{String($0)}
    // 사전 초기화
    for i in 1...26 {
        dict[String(UnicodeScalar(65+(i-1))!)] = i
    }
    //print(dict)
    var result: [Int] = []
    var (start,end) = (0,0)
    // 배열이 빌때까지
    while !msg.isEmpty {
        if end >= msg.count { break }
        let condition: ((String,Int)) -> Bool = {$0.0.contains(msg[start...end].joined())}
        // 만약 있던 단어라면
        if dict.contains(where: condition) == true{
            print("있는 단어",dict[msg[start...end].joined()]!)
            //result.append(dict[msg[start...end].joined()]!)
            end += 1
            continue
        } else {
            // 없는 단어라면
            print("추가",msg[start...end].joined())
            dict[msg[start...end].joined()] = dict.count + 1
            print("전 단어 추가 ",dict[msg[start..<end].joined()]!)
            result.append(dict[msg[start..<end].joined()]!)
            msg.removeSubrange(start..<end)
            end = 0
        }
    }
    return []
}
```

```
/*
길이가 1인 모든단어를 포함하도록 사전 초기화
사전에 현재 입력과 일치하는 가장 긴 문자열 찾기
그 문자열에 해당하는 사전의 색인 번호를 출력하고 문자열 제거
입력에서 처리되지않은 다음글자가 있다면 a+b에 해당하는 단어를 사전에 등록
다시 긴 문자열 찾기
*/

/*
사전은 A~Z(1~26)까지가 초기로 등록
예를 들어 KAKAO라면 K는 등록되어있으나 KA까지는 없으므로 K의 11 출력, KA를 27번으로 등록
두번째글자 A = 1, AK는 없으므로 28번
KA는 이미 있으므로 27출력, KAO 29번으로 등록
O 15번 출력
*/

func solution(_ msg:String) -> [Int] {
    var dict = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map({ String($0) })
    var msg = msg.map{String($0)}
    var result: [Int] = []
    var input = ""
    while !msg.isEmpty {
        input += msg.removeFirst()
        
        // 만약 다음글자가 없다면
        guard let next = msg.first else {
            result.append(dict.firstIndex(of: input)!+1)
            break
        }
        
        // 만약 다음글자까지 합친 글자가 사전에 없다면
        if let index = dict.firstIndex(of: input), !dict.contains(input+next) {
            // result 추가
            result.append(index+1)
            //print(result)
            // 사전 추가
            dict.append(input+next)
            input = ""
        }
    }
    return result
}
```
