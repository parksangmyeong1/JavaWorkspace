package ch08;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.printf("첫번째 숫자를 입력해 주세요 : \n");
		int num1 = s.nextInt();
		System.out.printf("두번째 숫자를 입력해 주세요 : \n");
		int num2 = s.nextInt();
		
		Calulator cal = new ImplementsCal();
		
		System.out.println("두 수의 합 : " + cal.add(num1, num2));
		System.out.println("두 수의 차 : " + cal.substract(num1, num2));
		System.out.println("두 수의 곱 : " + cal.multiply(num1, num2));
		System.out.println("두 수의 나눔 : " + cal.divide(num1, num2));
	}

}
