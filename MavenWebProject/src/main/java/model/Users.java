package model;

public final class Users {
	private String uname;
	private String uemail;
	private String upass;
	private String ucontact;
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Users(String uemail, String upass) {
		super();
		this.uemail = uemail;
		this.upass = upass;
	}


	public Users(String uname, String uemail, String upass, String ucontact) {
		super();
		this.uname = uname;
		this.uemail = uemail;
		this.upass = upass;
		this.ucontact = ucontact;
	}

	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getUcontact() {
		return ucontact;
	}
	public void setUcontact(String ucontact) {
		this.ucontact = ucontact;
	}
	
	
	
}
