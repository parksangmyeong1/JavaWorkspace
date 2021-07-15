package ch09;

import java.text.*;
import java.util.*;


public class GetDate {
	public static void main(String[] args) throws ParseException {
		Calendar getToday = Calendar.getInstance();
		getToday.setTime(new Date()); //금일 날짜
		
		Scanner sc = new Scanner(System.in);
		System.out.printf("생일을 입력해 주세요(YYYY-MM-DD) : ");
		String s_date = sc.nextLine();
		
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s_date);
		Calendar birthDate = Calendar.getInstance();
		birthDate.setTime(date); //생일
		
		// 차이 시간을 찾고, 일자로 변환
		long diffSec = (getToday.getTimeInMillis() - birthDate.getTimeInMillis()) / 1000;
		long diffDays = diffSec / (24*60*60); 
		
		System.out.println("생일을 기준으로  " + diffDays + "일 살았습니다.");
	}
}
