package ex.io;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class StringReader {

	public static void main(String[] args) {
		try {			
			BufferedReader in = new BufferedReader(new FileReader("String.txt"));
			
			System.out.println("시작");
			
			// 임시 변수
			String str = null;
			
			while(true) {
				
				str = in.readLine();
				
				if(str==null) {
					break;
				}
				System.out.println(str);
			}
			
			in.close();
			
			System.out.println("완료");
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
