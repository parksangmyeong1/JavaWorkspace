package app_project;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class SmartPhone {
    String name, phone, email, address, birth, group,
    company, department, position, client, item;    
    
    List<Contact> contacts = new ArrayList<Contact>();
    
    void addContact(){
    	Scanner sc = new Scanner(System.in);
        System.out.println("--------------------");
        System.out.print("이름을 입력해주세요 : ");
        name = sc.nextLine();
        System.out.print("전화번호를 입력해주세요 : ");
        phone = sc.nextLine();
        System.out.print("이메일을 입력해주세요 : ");
        email = sc.nextLine();
        System.out.print("주소를 입력해주세요 : ");
        address = sc.nextLine();
        System.out.print("생일을 입력해주세요 : ");
        birth = sc.nextLine();
        System.out.print("그룹을 선택해주세요 \n1. 회사 2. 거래처 : ");
        group = sc.nextLine();
        if(group.equals("1")) {
        	group = "회사";
        	System.out.printf("회사이름을 입력해주세요 : ");
        	company = sc.nextLine();
        	System.out.printf("부서이름을 입력해주세요 : ");
        	company = sc.nextLine();
        	System.out.printf("직급을 입력해주세요 : ");
        	company = sc.nextLine();
        	
        	Contact person = new CompanyContact(name, phone, email, address, birth, group, company, department, position);
        	contacts.add(person);
        }
        else if(group.equals("2")) {
        	group = "거래처";
        	System.out.printf("거래처회사이름을 입력해주세요 : ");
        	company = sc.nextLine();
        	System.out.printf("거래품목을 입력해주세요 : ");
        	company = sc.nextLine();
        	System.out.printf("직급을 입력해주세요 : ");
        	company = sc.nextLine();
    	
        	Contact person = new CustomerContact(name, phone, email, address, birth, group, client, item, position);
        	contacts.add(person);
        }
        else {
        	System.out.println("잘못입력하셨습니다.");
        }
        System.out.println("--------------------");
        
        
    }
    
    void showContact() {
        System.out.println("연락처 리스트를 보여드립니다");
        System.out.println("--------------------");
        for (int i = 0; i < contacts.size(); i++) {
            System.out.println((i+1) + " " + contacts.get(i).getName());
        }
        System.out.println("현재 저장된 리스트 : " + contacts.size() + "명");
        System.out.println("--------------------");
    }
    
    void delContact() {
    	System.out.println("리스트를 보여드립니다. ");
    	showContact();
    	System.out.printf("삭제할 사람의 이름을 입력해주세요. : ");
    	Scanner sc = new Scanner(System.in);
    	String mname;
    	mname = sc.nextLine();
    	
    	for (int i = 0; i < contacts.size(); i++) {
            if(mname.equals(contacts.get(i).getName())){
            	contacts.remove(i);
            }
        }
    	System.out.println("삭제 되었습니다.");
    	System.out.println("--------------------");
    }

    void findContact() {
    	System.out.printf("찾고자 하는 사람의 이름을 입력해주세요 : ");
    	Scanner sc = new Scanner(System.in);
    	String mname;
    	mname = sc.nextLine();
    	
    	for (int i = 0; i < contacts.size(); i++) {
            if(mname.equals(contacts.get(i).getName())){
            	System.out.println(contacts.get(i).getName() + "님은 " + (i+1) + "에 저장되어있습니다.");
            }
        }
    }
    
    void modifyContact() {
    	System.out.printf("수정하고 싶은 사람의 이름을 입력해주세요 : ");
    	Scanner sc = new Scanner(System.in);
    	String mname;
    	mname = sc.nextLine();
    	
    	for (int i = 0; i < contacts.size(); i++) {
            if(mname.equals(contacts.get(i).getName())){
            	
            	System.out.printf("수정할 목록을 입력해주세요 : ");
            	System.out.println("1. 이름  2. 전화번호  3. 이메일  4. 주소  5. 생일  6. 그룹");
            	int input;
            	input = Integer.parseInt(sc.nextLine());
            	
            	switch(input) {
            	case 1 : 
                	name = sc.nextLine();
                	contacts.get(i).setName(name);
                	System.out.println(contacts.get(i).getName() + "님의 이름이 " + name + "으로 수정되었습니다.");
                	break;
            	case 2 : 
            		phone = sc.nextLine();
                	contacts.get(i).setPhone(phone);
                	System.out.println(contacts.get(i).getName() + "님의 전화번호가 " + phone + "으로 수정되었습니다.");
                	break;
            	case 3 : 
            		email = sc.nextLine();
                	contacts.get(i).setEmail(email);
                	System.out.println(contacts.get(i).getName() + "님의 이메일이 " + email + "으로 수정되었습니다.");
                	break;
            	case 4 : 
            		address = sc.nextLine();
                	contacts.get(i).setAddress(address);
                	System.out.println(contacts.get(i).getName() + "님의 주소가 " + address + "으로 수정되었습니다.");
                	break;
            	case 5 : 
            		birth = sc.nextLine();
                	contacts.get(i).setBirth(birth);
                	System.out.println(contacts.get(i).getName() + "님의 생일이 " + birth + "으로 수정되었습니다.");
                	break;
            	case 6 : 
                	group = sc.nextLine();
                	contacts.get(i).setGroup(group);
                	System.out.println(contacts.get(i).getName() + "님의 그룹이 " + group + "으로 수정되었습니다.");
                	break;
                	
            	}
            }
        }
    	
    }
}