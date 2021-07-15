package ch09;

public class SystemTime {

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		
		int i=0;
		int sum = 0;
		while(i<=100000000) {
			sum += i;
			i++;
		}
		
		long end = System.currentTimeMillis();
		
		System.out.println("1~100,000,000까지 더하기하는 연산의 합 : " + sum);
		System.out.println("1~100,000,000까지 더하기하는 연산의 실행 시간 : " + (end-start));
	}

}
