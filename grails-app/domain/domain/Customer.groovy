package domain

class Customer {
	String login
	String password
    static constraints = {
		login(blank:false,nullable:false, maxSize:100)
		password(blank:false, maxSize:50, password:true)
    }
	def beforeInsert={
		password=password.encodeAsMD5()
	}
	def beforeUpdate=
	{
		password=password.encodeAsMD5()
	}
	String toString()
	{
		login
	}
	
}
