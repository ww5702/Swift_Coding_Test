구현과 정렬을 확인하는 문제이다.   
prefix와 suffix를 이용해 숫자가 나오기전까지 head에, num과 head의 합의 뒤부터 끝까지 tail에 나눈뒤 튜플에 저장   
나눈 튜플의 head, num을 뽑아 조건에 따라 정렬한다   

```
func solution(_ files:[String]) -> [String] {
    var tuple = [(head: String, number: String, tail: String, idx: Int)]()
    var numbers = ["1","2","3","4","5","6","7","8","9","0"]
    
    for idx in 0..<files.count {
        // head 구하기
        let head = files[idx].prefix{!$0.isNumber}
        
        var number = ""
        // number 구하기
        for char in Array(files[idx])[(head.count)...] {
            // 숫자는 한글자에서 최대 다섯글자이기에
            if number.count < 5 && char.isNumber {
                number += String(char)
            } else {
                break
            }
        }
        // tail 구하기
        let tail = files[idx].suffix(files[idx].count - (head.count + number.count))
        
        //print(head, number, tail)
        // 튜플에 정리
        tuple.append((head: String(head), number: number, tail: String(tail), idx: idx ))
    }
    //print(tuple)
    
    tuple = tuple.sorted{
        let head1 = $0.head.lowercased()
        let head2 = $1.head.lowercased()
        
        let num1 = Int($0.number)!
        let num2 = Int($1.number)!
        
        // head가 같고
        if head1 == head2 {
            // number가 같으면
            if num1 == num2 {
                return $0.idx < $1.idx
            }
            // head만 같다면 num으로
            return num1 < num2
        }
        // head부터 다르다면 head로
        return head1 < head2
    }
    //print(tuple)
    var result: [String] = []
    for t in tuple {
        result.append("\(t.head)\(t.number)\(t.tail)")
    }
    return result
}
```
