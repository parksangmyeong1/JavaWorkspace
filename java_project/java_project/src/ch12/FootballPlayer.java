package ch12;

import java.io.Serializable;

public class FootballPlayer implements Comparable<FootballPlayer>, Serializable{
	String name;
	int number;
	String team;
	int age;
	
	public FootballPlayer (String name,int number,String team,int age) {
		this.name = name;
		this.number = number;
		this.team = team;
		this.age = age;
	}
	
	public String toString() {
		return "FootballPlayer [ Name = " + name + 
				", Number = " + number + 
				", Team = " + team +
				", Age = " + age + "]";
	}
	
	@Override
    public int hashCode() {
        return age%10;
    }
	
	@Override
    public boolean equals(Object obj) {
        boolean result = false;
        if((obj != null) && (obj instanceof FootballPlayer)) {
        	FootballPlayer temp = (FootballPlayer)obj;
        	if(this.team.equals(temp.team)&&this.name.equals(temp.name)&&this.age==temp.age) {
        		result = true;
        	}
        }
		return result;
    }
	
	@Override
	// 팀 이름순으로 정렬하고,같은 팀의 선수들은 이름 순으로 정렬하고, 
	// 같은 이름의 선수는 번호 순으로 저장하는 프로그램을 만들어 봅시다.
	public int compareTo(FootballPlayer obj) {
		int result = team.compareTo(obj.team);
		if(result == 0) {
			result = name.compareTo(obj.name);
				if(result==0) {
					if(number>obj.number) {
						result = 1;
				}
					else
						result = -1;
			}
		}
		return result;
	}
}
