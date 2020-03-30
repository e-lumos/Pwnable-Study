# C++ 배우기

## C++ 스타일 입출력

- iostream : C++에 있는 입출력을 위한 헤더 파일로, C++ 표준 라이브러리 중 하나
- namespace : 하나의 소속 같은 개념으로, 변수 혹은 함수의 이름이 같더라도 namespace가 다르면 구분해서 사용 가능함
- C++의 입출력
    - std::cin : 콘솔 입력 함수, std::cin >> a >> b; 와 같이 사용
    - std::cout : 콘솔 출력 함수, std::cout << a << b; 와 같이 사용
    - std::endl : \n과 같은 역할을 함
    - using namespace std를 통해 앞의 std::을 생략 가능함
- 문자열 자료형 : string
    - string 헤더 파일과 함께 사용
    - 크기에 대한 제약이 없음
    - +와 같은 연산자로 간단히 표시 가능

    #include <iostream>
    #include <string>
    
    using namespace std;
    
    int main() {
    	string name;
    	
    	cout << "이름 입력 : ";
    	cin >> name;
    
    	string message = "안녕하세요, " + name + "님";
    	cout << message << endl;
    	return 0;
    }

    실행 결과
    
    이름 입력 : 김동현
    안녕하세요, 김동현님

## C++ 스타일 기본 문법

- 변수의 초기화
    - C언어에서 int a = 10; == C++에서 int a(10);
- 범위 기반 for 문
    - for문의  (초기화식 ; 조건식 ; 증감식) 대신 (변수 : 배열)을 사용 가능
    - 변수의 이름으로 배열의 모든 요소를 대입 가능
    - 변수에 계산을 해도 배열의 값은 바뀌지 않음 ( Call - by - Value 개념)
    - 레퍼런스 변수
        - 변수에 &을 붙여 함수를 Call-by-Reference로 사용 가능
- r-value
    - 수정할 수 없는 값을 참조 가능

    #include <iostream>
    
    using namespace std;
    
    int main() {
    	int arr[10] = { 3, 1, 4, 1, 5, 9, 2, 6, 5, 3 };
    
      //Call-by-Value
      for (int n : arr) {
    	  cout << n << ' ';
      }
      cout << endl;
        
      //Call-by-Reference
      for (int &n : arr) { //&n : reference 변수
    	  n++;  
        cout << n << ' ';
      }
      cout << endl;
    	return 0;
    }

    실행 결과
    
    3 1 4 1 5 9 2 6 5 3 
    4 2 5 2 6 10 3 7 6 4

## C++ 스타일 함수

- Over Load : 다중 정의, 함수를 여러번 정의함
    - 비슷한 기능을 하는 함수가 다른 형식, 다른 개수의 매개변수를 받더라도, 그 매개변수에 의한 함수 형식을 선언해 놓으면 프로그램이 알아서 알맞는 함수를 실행시킴
    - 함수를 선언할 때 매개변수의 초기값을 지정 가능
        - 초기값을 지정해준 매개변수는 오른쪽부터 시작하여야 함

    #include <iostream>
    
    using namespace std;
    
    int inventory[64] = { 0 };
    int score = 0;
    
    void getItem(int itemId) {
    	inventory[itemId]++;
    }
    
    void getItem(int itemId, int cnt) {
    	inventory[itemId] += cnt;
    }
    
    void getItem(int itemId, int cnt, int sc) {
    	inventory[itemId] += cnt;
    	score += sc;
    }
    
    int main() {
    	getItem(6, 5);
    	getItem(3, 2);
    	getItem(3);
    	getItem(11, 34, 7000);
    
    	cout << score << endl;
    	for (int i = 0; i < 16; i++) {
    		cout << inventory[i] << ' ';
    	}
    	cout << endl;
    	return 0;
    }

    실행 결과
    
    7000
    0 0 0 3 0 0 5 0 0 0 0 34 0 0 0 0

## 7부 종합문제

- 이름과 점수를 입력받고, 다음과 같이 출력되는 프로그램을 작성해 보세요

    #include <iostream>
    #include <string>
    
    using namespace std;
    
    int main() {
    	string name;
    	int score;
    
    	cout << "이름 입력 : ";
    	cin >> name;
    	cout << "점수 입력 : ";
    	cin >> score;
    
    	cout << name << "님의 점수는 " << score << "점입니다." << endl;
    }

    실행 결과
    
    이름 입력 : 김동현
    점수 입력 : 80
    김동현님의 점수는 80점입니다.

- 범위 기반 for문을 사용하여 이차원 배열을 출력해 보세요

    #include <iostream>
    
    using namespace std;
    
    int main() {
    	int arr[2][3] = { { 1, 2, 3 }, { 4, 5, 6 } };
    
    	//레퍼런스 변수 사용
      for (int(&ln)[3] : arr) { 
    	  for (int &col : ln) {
    	    cout << col << ' ';
        }
    	    cout << endl;
      }
        
      return 0;
    }

    실행 결과
    
    1 2 3 
    4 5 6

- 다음과 같은 함수 정의에서 컴파일 오류가 나는 이유를 찾아보세요

    void drawRectangle(int 1, int r, int t, int b) {
    
    }
    
    //defalt 매개변수는 오른쪽부터 부여해야 함
    //매개변수의 종류와 개수가 같아 구별할 수 없음
    void drawRectangle(int x = 0, int y = 0, int w, int h) { 
    
    }
    
    int main() {
    	drawRectangle(0, 0, 0, 0);
    }