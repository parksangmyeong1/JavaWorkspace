package ncs.member;

public class Member {
	
	private int idx;
	private String id;
	private String pw;
	private String name;
	private String date;
	private String photo;
	public Member() {}
	public Member(String name) {}
	public Member(String id,String pw, String name) {
		this.id=id;
		this.pw=pw;
		this.name=name;
	}
	public Member(int idx, String id,String pw,String name) {
		this.id=id;
		this.pw=pw;
		this.name=name;
	}
	public Member(int idx, String id,String pw,String name,String date, String photo) {
		this.idx = idx;
		this.id=id;
		this.pw=pw;
		this.name=name;
		this.date=date;
		this.photo=photo;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Override
	public String toString() {
		return "Member [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", date=" + date + ", photo="
				+ photo + "]";
	}
	
	// Member -> LoginInfo 반환해주는 메소드
	public LoginInfo toLoginInfo() {
		return new LoginInfo(this.idx,this.id,this.name,this.photo);
	}
	
}
