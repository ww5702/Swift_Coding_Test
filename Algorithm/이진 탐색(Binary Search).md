# 이진 탐색(Binary Search) 
완전 탐색 알고리즘은 최악의 경우 모든 배열을 순회하기 때문에 시간 복잡도가 O(N)이다.   
하지만 이진 탐색은 완전 탐색 보다는 좋은 성능을 보여준다.   
   
이진 탐색은 자료를 둘로 나누어 해당 데이터가 있을 곳을 탐색하는 것이다.   
또한 해당 자료가 정렬되어 있을때만 사용이 가능하다.   
   
![image](https://github.com/ww5702/Swift_Coding_Test/assets/60501045/09456225-8e47-4f86-865b-432cc86a4bc1)   
   
그림을 보았을때 35란 데이터를 찾는다고 가정한다면   
가장 먼저 mid(20) 를 기준으로 반으로 나누는것이다.   
그리고 20보다 35가 크니 오른쪽 데이터들을 탐색하는 것이다.   
그리고 윗 작업을 찾을때까지 반복한다.   
   
![image](https://github.com/ww5702/Swift_Coding_Test/assets/60501045/c2a2022c-7155-4740-bc28-e620ef731a5a)
   
20을 기준으로 오른쪽 데이터만 남겨뒀을때 23 29 35가 남는다.   
해당 값들의 mid(29)를 기준으로 찾고자 하는 데이터가 더 크므로 오른쪽 데이터를 남겨   
윗 작업을 다시 진행한다.   
그리고 윗 작업을 진행하다가 찾고자 하는 데이터와 35가 같다면 true를 다르다면 false를 반환해준다.   
   
구현   
```
func binarySearch(_ array: [Int], _ num: Int) -> Bool {
   var start = 0
   var end = array.count-1
   while start <= end {
      let mid = (start+end)/2
      if array[mid] == num { return true }
      if array[mid] < num {
         end = mid - 1
      } else {
         start = mid + 1
      }
   }
   return false
}
```
이진 탐색의 시간복잡도는 n개의 배열을 2로 나누어 배열의 개수가 1이 될때까지 반복하지 O(logN)이다.   
