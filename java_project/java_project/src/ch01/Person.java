package ch01;

public class Person {
	String name;
	String number;
	String idNo;
	
	public Person(String name, String number, String idNo) {
		this.name = name;
		this.number = number;
		this.idNo = idNo;
	}
	public void Info() {
		System.out.println("이름 : " + name);
		System.out.println("전화번호 : " + number);
		System.out.println("주민등록번호 : " + idNo);
	}
	public static void main(String[] args) {
		Person person = new Person("박상명","010-1234-5678","210525-1234567");
		
		person.Info();
	}
}
