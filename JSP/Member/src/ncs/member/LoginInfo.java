package ncs.member;

public class LoginInfo {
	
	// 빈즈라 생성자 따로  필요없음
	// 가지고 다닐 정보를 따로 저장, 민감한 정보 아닌 위주로 가지고 다니기 위해
	private int idx;
	private String id;
	private String name;
	
	public LoginInfo(int idx, String id, String name) {
		this.idx = idx;
		this.id = id;
		this.name = name;
	}

	// getter만
	public int getIdx() {
		return idx;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	@Override
	public String toString() {
		return "LoginInfo [idx=" + idx + ", id=" + id + ", name=" + name + "]";
	}
	
}
