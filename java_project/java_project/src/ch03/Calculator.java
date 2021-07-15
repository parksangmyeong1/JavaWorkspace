package ch03;

import java.util.*;

public class Calculator {
	public long add(int num1, int num2) {
		return num1+num2;
	}
	public long sub(int num1, int num2) {
		return num1-num2;
	}
	public long mul(int num1, int num2) {
		return num1*num2;
	}
	public long div(int num1, int num2) {
		return num1/num2;
	}
	public double area(double r) {
		return Math.PI*r*r;
	}
	public double length(double r) {
		return 2*Math.PI*r;
	}
	public static void main(String[] args) {
		
		Calculator cal = new Calculator();
		
		System.out.printf("첫번째 숫자를 입력해주세요 : ");
		Scanner sc1 = new Scanner(System.in);
		int num1 = sc1.nextInt();
		System.out.printf("두번째 숫자를 입력해주세요 : ");
		Scanner sc2 = new Scanner(System.in);
		int num2 = sc2.nextInt();
		
		System.out.println("두 수의 합 : " + cal.add(num1, num2));
		System.out.println("두 수의 차 : " + cal.sub(num1, num2));
		System.out.println("두 수의 곱 : " + cal.mul(num2, num2));
		System.out.println("두 수의 나눔 : " + cal.div(num1, num2));
		
		System.out.println("------------------------");
		System.out.printf("두번째 숫자를 입력해주세요 : ");
		Scanner s = new Scanner(System.in);
		double input = s.nextDouble();
		
		System.out.printf("원의 둘레 : %.6f\n",cal.length(input));
		System.out.printf("원의 넓이 : %.6f\n",cal.area(input));
	}
	
}	
