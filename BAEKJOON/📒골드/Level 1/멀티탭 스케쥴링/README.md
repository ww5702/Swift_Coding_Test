2 7   
2 3 2 3 1 2 7   
가 있다고 가정하자.   
일단 멀티탭의 갯수까지 전자기기를 낄수있다.   
따라서 2,3은 집어넣고 생각하면된다.   
그리고 그 다음부터는 확인해야할 부분이 2가지 있다.   
1번 이미 껴져있는 전자기기인가 >> 넘어가면된다.   
2번 새로운걸 끼긴해야하는데 무엇을 뺄것인가   
그렇다면 어떤 전자기기를 빼야할까   
단순하게 생각하면 앞으로 사용안할 전자기기 or 제일 늦게 사용할 전자기기를 뺴주는것이다.   
만약 2,3,4 가 껴져있고 5를 넣어야하는 상황이라고 가정하자   
5,3,4,2 이렇게 순서가 지정되어있다고 하자   
2는 3,4보다 비교적 늦게 껴야하므로 2를 빼야 한다는 의미이다.   
하지만 96프로에서 런타임 에러 발생   
런타임에러 발생은 인덱스나 배열의 크기가 오류일 가능성이 크므로 해당 문제들을 검토해봐야겠다.   

```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var q: [Int] = []
    var result = 0
    
    if n >= k {
        print(result)
    } else {
        var idx = 0
        while q.count < n {
            if !q.contains(arr[idx]) {
                q.append(arr[idx])
                //print(q,idx)
            }
            idx += 1
        }
        //print("여기", q)
        
        for i in idx..<k {
            //print(arr[i])
            if q.contains(arr[i]) {
                continue
            } else if q.count < n {
                q.append(arr[i])
            } else {
                var temp = Set(q)
                // 뒤에 현재 껴져있는 전자기기중 또 껴야할 전자기기가 있다면 패스
                for j in i+1..<k {
                    if temp.count == 1 { break }
                    if temp.contains(arr[j]) {
                        temp.remove(arr[j])
                    }
                }
                q.remove(at: q.firstIndex(of: temp.first!)!)
                q.append(arr[i])
                result += 1
                //print(q, result)
                
            }
        }
        
        print(result)
    }
    
    
}
solution()
/*
 */

```
문제는 쉽게 찾을 수 있었다.   
나는 1 1 1 2 3과 같이   
만약에 처음부터 같은 전자기기가 여러개라면 패스해주는 알고리즘을 따로 짰는데   
만약 1 1 1 1 1과 같이 끝까지 가버린다면 실패하는 경우였다.   
따라서 해당 코드를 지우고, 0부터 반복하면서 q.count < n 와 q.contains를 이용해 해결하였다.   


```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var q: [Int] = []
    var result = 0
    
    if n >= k {
        print(result)
    } else {
        for i in 0..<k {
            //print(arr[i])
            if q.contains(arr[i]) {
                continue
            } else if q.count < n {
                q.append(arr[i])
            } else {
                var temp = Set(q)
                // 뒤에 현재 껴져있는 전자기기중 또 껴야할 전자기기가 있다면 패스
                for j in i+1..<k {
                    if temp.count == 1 { break }
                    if temp.contains(arr[j]) {
                        temp.remove(arr[j])
                    }
                }
                q.remove(at: q.firstIndex(of: temp.first!)!)
                q.append(arr[i])
                result += 1
                //print(q, result)
                
            }
        }
        
        print(result)
    }
    
    
}
solution()
/*
 */

```
만약 첫 코드를 그대로 사용하고 싶다면   
while q.count< n 해당 코드에    
if idx == k { break } 만 넣어준다면 통과하게 되어있다.   
```
var idx = 0
while q.count < n {
    if !q.contains(arr[idx]) {
        q.append(arr[idx])
        //print(q,idx)
    }
    idx += 1
    if idx == k { break }
}
```
