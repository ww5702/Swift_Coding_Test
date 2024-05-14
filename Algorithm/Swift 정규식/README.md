문자열 문제가 너무 어려워서 정리를 위해 작성한다.   
[매칭 점수](https://github.com/ww5702/Swift_Coding_Test/tree/main/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4/Level%203/%EB%A7%A4%EC%B9%AD%20%EC%A0%90%EC%88%98)   

기본적으로 \는 연산자 역할을 하므로 \ 문자 자체를 사용하고 싶으면 \\ 를 써야한다 정도는 알 것이다.   

[참고한 사이트](https://borabong.tistory.com/32#google_vignette)   

## 정규식
```
"^[A-Z]*$" // 대문자로만 구성
"^[a-z]*$" // 소문자로만 구성
"^[0-9]*$" // 숫자로만 구성
"^[\\D]*$" // 숫자 제외로 구성
"^[0-9a-zA-Z]*$" // 대소문자와 숫자로 구성
"^[\\w]*$" // 대소문자와 숫자로 구성
"^[\\W]*$" // 반대 (알파벳, 숫자 제외)
"^[~!@#\\$%\\^&\\*]*$" 특수문자로 구성 -> 여기서 \\를 해준 기호들은 정규식에서 사용되는 문자들이다.


같은 문자가 n번 반복될경우
. // 어떤 문자든지 한글자를 의미한다.
() 괄호 사이에 정규식 연산이 들어갈수 있는데
([A-Z]+)는 알파벳 대문자중 한글자가 여러번 반복되는 형태와 일지된다
\1 재참조 메타 문자 : 첫번째 그룹(괄호로 묶인 부분) 형태가 1번 반복된다.

{5} = 5글자
{5,10} = 5글자 이상 10글자 이하
{5,} = 5글자 이상

?<> 으로 그룹으로 묶인 문자열에 이름을 붙여줄수 있다.

```

## 문자열 일부가 일치하는지 확인하는 법
```
// regex: 정규식 문자열
string.range(of: regex, options: .regularExpression)
regex = "[0-9]*" -> 0~9로 이루어져있는지

```

## 문자열 일치하는 모든 범위를 알아야하는 경우
```
NSRegularExpression을 사용할때는 try? do try catch문을 사용해야 한다.

do {
 let regex = try NSRegularExpression(pattern: pattern, options: [])
 let result = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
 let rexString = result.map{(element) -> String in
   let range = Range(element.range, in: string)!
        return String(string[range])
    }
    return rexStrings
} catch let error {
    print(error.localizedDescription)
}
```
예를 들면 이와 같다.
```
let string: String = "기간은 2021.03.01 부터 2021.03.31까지 입니다."
let datePattern: String = "(?<year>(19|20)[0-9]{2})\\.(?<month>(0[1-9]|1[0-2]))\\.(?<date>(0[1-9]|1[0-9]|2[0-9]|3[0-1]))"

let regex = try? NSRegularExpression(pattern: datePattern, options: [])
if let result = regex?.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)) {
    let rexStrings = result.map { (element) -> String in
        let yearRange = Range(element.range(withName: "year"), in: string)!
        let monthRange = Range(element.range(withName: "month"), in: string)!
        let dateRange = Range(element.range(withName: "date"), in: string)!
    
        return "\(string[yearRange])년 \(string[monthRange])월 \(string[dateRange])일"
    }
    print(rexStrings)
}
```
여기서 yyyy.mm.dd의 날짜 형식을 모두 찾아낼 수 있다.   
