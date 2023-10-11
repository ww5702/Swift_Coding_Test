작업을 수행하고 있지 않을때는 제일 먼저 들어온 순서로 진행한다고 적혀있다.   
따라서 처음 반복문으로 0초에 시작이 가능한 작업들을 모두 append한다.   
그 후 현재 시간 - 작업이 가능했던시간 = 대기시간   
대기시간 + 작업시간 이 짧은 순서로 정렬으로 먼저 작업을 수행할 목록들을 정렬한다.   
그 후 해당 작업을 진행하면서 현재 시간과 총 걸린 시간을 계산한다.   
시간이 변경됨에 따라 해당 시간까지 대기열에 들어온 작업들을 다시 정렬해주고   
정렬된 작업들중 제일 효율이 좋은 작업을 선정해 작업을 진행한다.   

```
import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var jobs = jobs.sorted{$0[0] < $1[0]}
    var waitList: [[Int]] = []
    var time = 0, lastIndex = 0, versus = 0
    waitList.append(jobs[0])
    lastIndex += 1
    for i in 1..<jobs.count {
        if jobs[i][0] == waitList[0][0] {
            waitList.append(jobs[i])
            lastIndex += 1
        } else {
            break
        }
    }
    //print(waitList, lastIndex)
    var result = 0
    while !waitList.isEmpty {
        // 기다린시간 + 작업시간 이 짧은 순으로 정렬 
        waitList = waitList.sorted{time-$0[0]+$0[1] < time-$1[0]+$1[1]}
        //print("정렬",waitList)
        var now = waitList[0]
        result += (time-now[0]+now[1])
        time += now[1]
        //print("현재시간, 걸린시간 =",time, result)
        waitList.removeFirst()
        for i in lastIndex..<jobs.count {
            if jobs[i][0] <= time {
                waitList.append(jobs[i])
                lastIndex += 1
                //print("현재 시간",time)
                //print("대기열 추가",waitList)
            } else {
                break
            }
        }
    }
    return result/jobs.count
}
```
풀이방법은 비슷하지만 좀더 문법적으로 깔끔하게 구현해보았다.   
removeFirst가 아닌 removeLast가 당연히 시간복잡도적으로 효율적이다.   

```
import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    /*
    처음에는 가장 먼저 도착한 작업을 수행한다
    이번 작업을 수행하는 동안 도착하는 작업들을 별도의 작업큐에 모은다
    작업큐에 도착한 작업들 중 수행시간이 가장 짧은 작업을 꺼내 수행한다
    모든 작업을 처리할때까지 2,3줄의 과정을 반복한다.
    */
    var sortedjob = jobs.sorted{$0[0] == $1[0] ? $0[1] > $1[1] : $0[0] > $1[0]}
    /*
    해당 정렬과는 반대로 정렬하는것이 맞으나 removeFirst의 시간복잡도보다
    removeLast가 훨씬 빠르기에 반대로 정렬하여 사용하였다.
    */
    var jobQ: [[Int]] = [sortedjob.removeLast()]
    var result = 0, time = jobQ.first![0]
    //print(jobQ, time, result)
    while !jobQ.isEmpty {
        // 현재 작업할 작업, 총 시간 변경
        let now = jobQ.removeLast()
        //print("현재",now)
        result += abs(time-now[0])+now[1]
        time += now[1]
        //print("작업 후 ",time, result)
        while !sortedjob.isEmpty && sortedjob.last![0] <= time {
            jobQ.append(sortedjob.removeLast())
        }
        jobQ.sort{$0[1] > $1[1]}
        //print("대기 큐",jobQ)
    }
    return result/jobs.count
}
```
