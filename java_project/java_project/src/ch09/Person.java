package ch09;

class Person {
    String name;
    String personNumber;
    
    Person(String name,String personNumber){
    	this.name = name;
    	this.personNumber = personNumber;
    }
    
    public boolean equals(Object obj) {
    	if(this.personNumber == ((Person)obj).personNumber)
    		return true;
    	else
    		return false;
    }
}