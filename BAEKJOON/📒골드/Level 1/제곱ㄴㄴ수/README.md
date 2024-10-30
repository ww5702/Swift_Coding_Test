에라토스테네스의 체로 지워가는 방식을 활용해봤지만 런타임에러 발생   

```
import Foundation
func solution(){
    let minmax = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (min,max) = (minmax[0], minmax[1])
    
    var list = Array(repeating: true, count: max+1)
    list[0] = false
    if min > 1 {
        for i in 2...Int(sqrt(Double(max))) {
            let num = i*i
            //print("제겁",num)
            for j in 1...max/num {
                //print(j)
                list[num*j] = false
            
        }
    }
    
    
    print(list[min...max].filter{$0}.count)
    
}

solution()
/*
 4 9 16
 4 8
 1 2 3 5 6 7 10
 */


```
에라토스테네스의 채를 이용해서 풀이하는것은 맞다   
하지만 Min이 1조가 넘는다면 연산해야하는 횟수가 말이 안된다.   
따라서 우리는 max가 min + 1,000,000을 넘지않는다를 주목해야한다.   
최대 연산횟수는 100만회를 넘지 않는다는 것이다.   
따라서 배열의 크기를 max-min+1까지만 만든다.   
30과 100을 예시로 들자   
우리가 알아야할 범위는 70개뿐이고,   
제곱수는 4부터 시작한다.   
30 / 4는 7이다.   
하지만 7 x 4는 28로 30이 되지 않는다.   
따라서 8 x 4부터 시작하여 100이 되지 않는 수까지 반복하는것이다.   
32 부터 96까지 false로 해당값을 바꿔주고, 정답을 1씩 빼준다.   
그 다음은 당연히 9이다.   
30 / 9는 3이고, 3 x 9는 27로 30보다 작기 때문에 4부터 시작한다.   
36부터 99까지 반복하면서 아직 안바뀐 값들을 false로 바꿔준다.   
한번 떠올리면 쉬운 문제인데 다짜고짜 에라토스테네스의 채를 이용하려고하면 절대 안풀리는 문제이다.   

```
import Foundation
func solution(){
    let minmax = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (min,max) = (minmax[0], minmax[1])
    
    var result = max - min + 1
    var list = Array(repeating: false, count: result)
    var i = 2
    while (i*i <= max) {
        //print(i)
        var num = min / (i*i)
        if (min % (i*i) != 0) {
            num += 1
        }
        //print(num)
        
        while num * (i*i) <= max {
            //print(num*(i*i))
            if list[num * (i*i) - min] == false {
                list[num * (i*i) - min] = true
                result -= 1
            }
            num += 1
        }
        i += 1
    }
    print(result)
}

solution()
/*
 4 9 16
 4 8
 1 2 3 5 6 7 10
 */

```
