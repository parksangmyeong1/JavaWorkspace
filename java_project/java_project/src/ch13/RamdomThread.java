package ch13;

import java.util.Scanner;

public class RamdomThread {

	public static void main(String[] args) {
		CountDownThread ct = new CountDownThread();
		Random rand = new Random();
		
		GuessNumThread gt = new GuessNumThread(rand);
		gt.start();
		ct.start();
	}

}
class GuessNumThread extends Thread{
	
	Random rand;
	
	GuessNumThread(Random rand){
		this.rand = rand;
	}
	public void run() {
		System.out.println("주어진 시간 10초 안에 1~100 사이의 숫자를 맞추세요.");
		rand.random();
		while(true) {
			Scanner sc = new Scanner(System.in);
			int num = Integer.parseInt(sc.nextLine());
			if(rand.getNum() == num) {
				System.out.println("정답은 " + rand.getNum() + "입니다.");
				break;
			}
			else if(rand.getNum()>num) {
				System.out.println("UP 높은 숫자를 입력해주세요 UP");
			}
			else {
				System.out.println("DOWN 낮은 숫자를 입력해주세요 DOWN");
			}
			
		}
		System.out.println("축하드립니다.");
		System.exit(0);
	}
}

class CountDownThread extends Thread{
	
	public void run() {
		for(int i=10;i>0;i--) {
//			System.out.println(i); 시간초 출력
			try {
				sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("주어진 시간이 초과하여 프로그램을 종료합니다.");
		System.err.println("실패했습니다.");
		System.exit(0);
	}
}

class Random{
	int num = 0;
	
	public void random() {
		num = (int)(Math.random()*100);
	}
	public int getNum() {
		return num;
	}
}
