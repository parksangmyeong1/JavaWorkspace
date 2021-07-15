package app_project;

public class Contact {
	private String name;
	private String phone;
	private String email;
	private String address;
	private String birth;
	private String group;
	
	public Contact(String name, String phone, String email, String address, String birth, String group) {
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.birth = birth;
		this.group = group;
	}

	@Override
	public String toString() {
		return "Contact [name=" + name + ", phone=" + phone + ", email=" + email + ", address=" + address + ", birth="
				+ birth + ", group=" + group + "]";
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {

		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
}
