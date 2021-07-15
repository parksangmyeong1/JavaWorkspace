package app_project;

public class CompanyContact extends Contact{

	private String company;
	private String department;
	private String position;
	
	public CompanyContact(String name, String phone, String email, String address, String birth, String group, String company, String department, String position) {
		super(name, phone, email, address, birth, group);
		this.company = company;
		this.department = department;
		this.position = position;
	}

	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	
	@Override
	public String toString() {
		return super.toString() + "CompanyContact [company=" + company + ", department=" + department + ", position=" + position + "]";
	}
	
	
}
