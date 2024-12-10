숫자가 커져야하기때문에 -는 잆을수없다.   
따라서 +와 *만 존재하는데   
여기서 예외 경우의수가 /이다   
만약 처음 숫자가 몇이던 /로 시작한다면 1로 시작할 수 있다.   
따라서 1로 시작하는 방법, s로 시작하는 방법 2가지 경우의수이다.   
그리고 나머지는 조건에 따라서 구현하면 된다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var (s,t) = (input[0],input[1])
    var result = "-1"
    
    func dfs(_ num: Int, _ list: String) {
        if num > t { return }
        //print(num,list)
        
        if num == t && result == "-1" {
            result = list
        } else if num == t && result != "-1" {
            if result.count > list.count {
                result = list
            } else if result.count == list.count {
                result = result < list ? result : list
            }
        }
        
        dfs(num+num, list+"+")
        if num != 1 {
            dfs(num*num, list+"*")
        }
        
        return
    }
    
    dfs(s, "")
    dfs(1, "/")
    if s == t {
        print(0)
    } else {
        print(result)
    }
}
solution()
/*
 14 * 14 =
 14
 14
 196 + 196 = 392
 
 처음에 /로 시작하는 방법
 
 */

```
