결국 더 무게가 무거운 가방을 주인공이 들어야하므로 두 가방 둘다 적어지는 방향으로 계산해야한다.   
따라서 해당경우를 abs로 가정하여 비교한다면 뺐지만 9퍼에서 실패   
신문제라 반례를 찾길 어려웠다.   
나중에 다시   

```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var arrA = readLine()!.split(separator: " ").map{Int(String($0))!}
    var arrB = readLine()!.split(separator: " ").map{Int(String($0))!}
    var sumA = arrA.reduce(0, +)
    var sumB = arrB.reduce(0, +)
    // 22 25
    for _ in 0..<k {
        print()
        // 8 6 // 4 15
        if abs(sumA - (sumB-arrB.last!)) < abs(sumB - (sumA-arrA.last!)) {
            sumB -= arrB.removeLast()
        } else {
            sumA -= arrA.removeLast()
        }
        print(arrA)
        print(arrB)
    }
    print(sumA > sumB ? sumA : sumB)
}

solution()
/*
 22 25
 22 21
 19 21
 
 */
  

```
