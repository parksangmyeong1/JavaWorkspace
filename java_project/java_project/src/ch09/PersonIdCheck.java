package ch09;

public class PersonIdCheck {

	public static void main(String[] args) {
		Person person1 = new Person("A","210531-1532486");
		Person person2 = new Person("B","940621-2652519");
		Person person3 = new Person("A","210531-1532486");
		
		System.out.println("1번과 2번은 같은 사람 인가요 ? : " + person1.equals(person2));
		System.out.println("1번과 3번은 같은 사람 인가요 ? : " + person1.equals(person3));
		System.out.println("2번과 3번은 같은 사람 인가요 ? : " + person2.equals(person3));
	}

}
