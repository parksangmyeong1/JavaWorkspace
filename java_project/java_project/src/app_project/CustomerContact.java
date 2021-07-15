package app_project;

public class CustomerContact extends Contact{

	private String client;
	private String item;
	private String position;
	
	public CustomerContact(String name, String phone, String email, String address, String birth, String group, String client, String item, String position) {
		super(name, phone, email, address, birth, group);
		this.client = client;
		this.item = item;
		this.position = position;
	}
	
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return super.toString() + "CustomerContact [client=" + client + ", item=" + item + ", position=" + position + "]";
	}
	
}
