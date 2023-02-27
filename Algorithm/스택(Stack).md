# 스택(Stack)이란?
스택은 나중에 입력된 것이 먼저 출력되는 LIFO(Last in First Out)의 데이터 구조를 나타낸다.   

## 주로 사용되는 메소드
1. push() - 스택의 하단에 요소를 추가   
2. pop() - 스택 상단의 요소를 꺼내서(삭제한 뒤) 반환   
3. peak() - 스택 상단의 요소를 꺼내서(삭제하지 않고) 반환   

## 서브 메소드
1. count() - 스택에 포함된 요소의 수를 반환   
2. isEmpty() - 스택에 포함된 요소가 있는경우(true)/ 없는경우(false)반환   
3. isFull() - 스택에 포함될 요소의 수가 결정되어 있는 경우 꽉찼다면(true) / 그렇지 않다면(false)반환   


## removeLast() vs popLast()
두 메소드는 공통적으로 배열의 마지막 요소(Element)를 없애고 해당 값을 return 해준다.   
   
![image](https://user-images.githubusercontent.com/60501045/221518092-4f99ff6b-aa56-44b0-abc7-8056127672df.png)   
   
하지만 두 메소드의 차이점은 존재한다.   
removeLast()는 값이 무조건 존재해야 하고,   
popLast()는 값이 없으면 nil을 리턴한다는 점이다.   
