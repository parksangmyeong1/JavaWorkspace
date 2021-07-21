package NCS.member;

public class Member {
	
	private int idx;
	private String id;
	private String pw;
	private String name;
	private String date;
	public Member() {}
	public Member(int idx, String id,String pw,String name) {
		this.id=id;
		this.pw=pw;
		this.name=name;
	}
	public Member(int idx, String id,String pw,String name,String date) {
		this.idx = idx;
		this.id=id;
		this.pw=pw;
		this.name=name;
		this.date=date;
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

	@Override
	public String toString() {
		return "member [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", date=" + date + "]";
	}

	
}
