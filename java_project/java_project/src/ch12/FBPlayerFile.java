package ch12;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;


public class FBPlayerFile {
	public static void main(String[] args) {
		
		try {
			
			// 저장할 경로 설정
			ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("C:\\javafolder\\FBPlayer.ser"));
			// 리스트 생성
			List<FootballPlayer> list = new ArrayList<>();
			// 리스트에 정보 저장
			list.add(new FootballPlayer("A", 1, "AAA", 20));
			list.add(new FootballPlayer("D", 4, "DDD", 31));
			list.add(new FootballPlayer("B", 2, "BBB", 25));
			list.add(new FootballPlayer("C", 3, "CCC", 29));
			list.add(new FootballPlayer("A", 1, "AAA", 20));
			// 리스트 저장
			out.writeObject(list);
			// close
			out.close();
			
			System.out.println("인스턴스 리스트 저장 완료");
			// 읽어들일 경로 설정
			ObjectInputStream in = new ObjectInputStream(new FileInputStream("C:\\\\javafolder\\\\FBPlayer.ser"));
			// 읽어들이기
			
			List<FootballPlayer> list2 = (ArrayList<FootballPlayer>)in.readObject();
			
			
			
			for(FootballPlayer player : list2) {
				System.out.println(player);
			}
			System.out.println("저장된 인스턴스 리스트 출력");
			in.close();
			
			
			
			
			
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
