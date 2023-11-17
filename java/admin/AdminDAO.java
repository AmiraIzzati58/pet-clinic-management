package admin;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.connection.ConnectionManager;

public class AdminDAO {
	
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	
	static int adminId;
	static String adminEmail, adminPassword, adminUsername;

	//admin login
	public static Admin login(Admin bean) throws NoSuchAlgorithmException
	{
		//get email and password
		adminEmail = bean.getAdminEmail();
		adminPassword = bean.getAdminPassword();
		
		//convert the password to MD5
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(adminPassword.getBytes());

		byte byteData[] = md.digest();

		//convert the byte to hex format
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}
		
		String query = "select * from admin where adminEmail='" + adminEmail + "'AND adminPassword='" + sb.toString() + "'";

		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(query);
			boolean more = rs.next();

			// if user exists set the isValid variable to true
			if (more) {
				int adminId = rs.getInt("adminId");
				String adminEmail = rs.getString("adminEmail");
				String adminUsername = rs.getString("adminUsername");
				bean.setAdminId(adminId);
				bean.setAdminEmail(adminEmail);
				bean.setAdminUsername(adminUsername);
				
				System.out.println(adminUsername);
				bean.setValid(true);
			}
			// if user does not exist set the isValid variable to false
			else if (!more) {
				System.out.println("Not exist");
				bean.setValid(false);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
		}

		return bean;
		
	}
	
	//admin register
		public void registerAdmin (Admin a) throws NoSuchAlgorithmException {

			adminEmail = a.getAdminEmail();
			adminUsername = a.getAdminUsername();
			adminPassword = a.getAdminPassword();
			
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(adminPassword.getBytes());

			byte byteData[] = md.digest();

			//convert the byte to hex format
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			String pass = sb.toString();
			
			try {
				currentCon = ConnectionManager.getConnection();			
				ps = currentCon.prepareStatement("insert into admin (adminEmail,adminUsername,adminPassword) values (?,?,?)");
				ps.setString(1, adminEmail);
				ps.setString(2, adminUsername);
				ps.setString(3, pass);

				ps.executeUpdate();
			}
			catch (Exception ex) {
				ex.printStackTrace();
				System.out.println(ex);
			}
			
		}
				
		//Update reset password
		public void updatePassword(Admin a) {
			
			adminEmail = a.getAdminEmail();
			adminPassword = a.getAdminPassword();

			System.out.println("reset email" + adminEmail);
			System.out.println("reset pass" + adminPassword);

			try {
				currentCon = ConnectionManager.getConnection(); // 2. establish connection
				String query = "update admin set adminPassword='"+adminPassword+"' WHERE adminEmail='"+adminEmail+"'";
				stmt = currentCon.createStatement(); // 3. create statement
				stmt.executeUpdate(query);

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
			}
		}
		
		//get user by email
		public static Admin getAdminByEmail(String adminEmail) {
			Admin us = new Admin();
			try {
				//call getConnection() method 
				currentCon = ConnectionManager.getConnection();
				//3. create statement  
				ps=currentCon.prepareStatement("select * from admin where adminEmail=?");
				ps.setString(1, adminEmail);
				//4. execute query
				rs = ps.executeQuery();

				if (rs.next()) {	            
					us.setAdminId(rs.getInt("adminId"));
					us.setAdminEmail(rs.getString("adminEmail"));				
					us.setAdminPassword(rs.getString("adminPassword"));

				}
				//5. close connection
				currentCon.close();
			}catch(Exception e) {
				e.printStackTrace();	
				System.out.println(e);

			}

			return us;
		}

			//method to get admin
	public static Admin getAdmin(Admin bean)  {   
		//get email
		adminEmail = bean.getAdminEmail();
		String searchQuery = "select * from admin where adminEmail='" + adminEmail + "'";
		try {
			//call getConnection() method 
			currentCon = ConnectionManager.getConnection();
			//3. create statement  
			stmt = currentCon.createStatement();
			//execute statement
			rs = stmt.executeQuery(searchQuery);

			boolean more = rs.next();

			// if user exists set the isValid variable to true
			if (more) {
				String adminEmail = rs.getString("adminEmail");
				bean.setAdminEmail(adminEmail);
				bean.setValid(true);
			}
			// if user does not exist set the isValid variable to false
			else if (!more) {
				bean.setValid(false);
			}
			//5. close connection
			currentCon.close();	
		}catch(Exception e) {
			e.printStackTrace();	
			System.out.println(e);

		}
		return bean;
	}
	
	//get user by id
		public static Admin getAdminById(int adminId) {
			Admin ag = new Admin();
			try {
				currentCon = ConnectionManager.getConnection();
				ps=currentCon.prepareStatement("select * from admin where adminId=?");

				ps.setInt(1, adminId);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {	            
					ag.setAdminId(rs.getInt("adminId"));
					ag.setAdminEmail(rs.getString("adminEmail"));
					ag.setAdminUsername(rs.getString("adminUsername"));
					ag.setAdminPassword(rs.getString("adminPassword"));
					}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return ag;
		}

}
