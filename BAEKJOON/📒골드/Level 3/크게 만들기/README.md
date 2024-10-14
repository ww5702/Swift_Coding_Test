구현은 쉬웠다.   
10 4   
4177252841   
가 있다고 할때   
앞에서부터 뒷 숫자가 제일 클때까지 집어넣어준다.   
4   
4 1   
7   
7 7   
7 7 2    
7 7 5   
7 7 5 2   
7 7 5 8   
여기서 k 4개를 다 썼다.   
따라서    
7 7 5 8 4 1 이 된다.   
하지만 이를 그대로 출력하면 72퍼쯤에서 틀리게 되는데   
만약 stack에 더 많은 숫자가 남아있을 수 도 있어서   
stack.count-k-1까지를 출력해줘야 한다.   

```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    var (n,k) = (nk[0],nk[1])
    var arr = readLine()!.map{Int(String($0))!}
    
    var stack: [Int] = []
    
    for a in arr {
        //print(stack)
        while k > 0 && !stack.isEmpty && stack.last! < a {
            stack.removeLast()
            k -= 1
        }
        stack.append(a)
    }
    //print(stack.map{String($0)}.joined(separator:""))
    for i in 0...(stack.count - k - 1) {
        print(stack[i], terminator: "")
    }
}
solution()
/*
 */


```
