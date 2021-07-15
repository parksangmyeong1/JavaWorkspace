package ch05;

public class Member {
	
	String name;
	String number;
	String major;
	int grade;
	String email;
	int birth;
	String address;
	
	public Member(String name,String number,String major,int grade,String email){
		this.name = name;
		this.number = number;
		this.major = major;
		this.grade = grade;
		this.email = email;	
	}
	public Member(String name,String number,String major,int grade,String email,
			int birth,String address) {
		this.name = name;
		this.number = number;
		this.major = major;
		this.grade = grade;
		this.email = email;
		this.birth = birth;
		this.address = address;		
	}
	public void printInfo() {
		System.out.println("이름 : " + name);
		System.out.println("전화번호 : " + number);
		System.out.println("전공 : " + major);
		System.out.println("학년 : " + grade);
		System.out.println("Email : " + email);
		System.out.println("생일 : " + birth);
		System.out.println("주소 : " + address);
		System.out.println();
	}
	public static void main(String[] args) {
		Member member1 = new Member("철수","010-3265-4815","수학과",3,"cs@naver.com");
		Member member2 = new Member("영희","010-9458-1254","국문과",4,"yh@gmail.com",3,"서울");
		
		member1.printInfo();
		member2.printInfo();
	}

}
