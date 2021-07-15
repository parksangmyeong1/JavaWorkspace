package ch01;

public class Member {
	String name;
	int age;
	double height;
	boolean hasBook;
	
	public Member(String name, int age, double height, boolean hasBook) {
		this.name = name;
		this.age = age;
		this.height = height;
		this.hasBook =  hasBook;
	}
	public void Info() {
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("키 : " + height);
		System.out.println("책 보유 : " + hasBook);
	}

	public static void main(String[] args) {		
		Member member = new Member("박상명",20,160.0,true);
		
		member.Info();
	}

}
