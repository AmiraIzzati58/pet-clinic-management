package Owner;

import java.sql.*;

import java.util.*;
import db.connection.ConnectionManager;

public class OwnerDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	private int ownerId;
	private String ownerName, ownerPhoneNo, ownerAddress;

	//add owner
	public void addOwner(Owner bean)
	{
		ownerName = bean.getOwnerName();
		ownerPhoneNo = bean.getOwnerPhoneNo();
		ownerAddress = bean.getOwnerAddress();
	
		
		try {
			//call getConnection() method
			con = ConnectionManager.getConnection();
			
			//3. create statement
			ps = con.prepareStatement("INSERT INTO owner(ownerName, ownerPhoneNo, ownerAddress)VALUES(?,?,?)");
			ps.setString(1, ownerName);
			ps.setString(2, ownerPhoneNo);
			ps.setString(3, ownerAddress);

			//4. execute query
			ps.executeUpdate();
			System.out.println("Successfully inserted");
			
			//5. close connection
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}
	
	//get all owners
	public static List<Owner> getAllOwners()
	{
		List<Owner> owners = new ArrayList<Owner>();
		
		try {
			//callC getConnection() method
			con = ConnectionManager.getConnection();
			
			//3. create statement
			stmt = con.createStatement();
			String sql = "SELECT * FROM owner ORDER BY ownerId";
			
			//4. execute query
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				//process result
				Owner o = new Owner();
				o.setOwnerId(rs.getInt("ownerId"));
				o.setOwnerName(rs.getString("ownerName"));
				o.setOwnerPhoneNo(rs.getString("ownerPhoneNo"));
				o.setOwnerAddress(rs.getString("ownerAddress"));
			
				owners.add(o);
			}
			//5. close connection
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		return owners;
		
	}
	
	//get owner id
	
	public static Owner getOwnerById(int ownerId)
	{
		Owner o = new Owner();
		
		try {
			//call getConnection() method
			con = ConnectionManager.getConnection();
			
			//3. create statement
			ps = con.prepareStatement("SELECT * FROM owner where ownerId=?");
			ps.setInt(1,ownerId);
			
			//4. execute query
			rs = ps.executeQuery();
			if(rs.next())
			{
				o.setOwnerId(rs.getInt("ownerId"));
				o.setOwnerName(rs.getString("ownerName"));
				o.setOwnerPhoneNo(rs.getString("ownerPhoneNo"));
				o.setOwnerAddress(rs.getString("ownerAddress"));	
			}
			//5. close connection
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return o;
		
	}
	
	//delete owner
	public void deleteOwner(int ownerId)
	{
		try {
			//call getConnection() method
			con = ConnectionManager.getConnection();
			
			//3. create statement
			ps = con.prepareStatement("DELETE FROM owner WHERE ownerId=?");
			ps.setInt(1, ownerId);
			
			//4. execute query
			ps.executeUpdate();
			
			//5. close connection
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//update owner
	
	public void updateOwner(Owner bean)
	{
		ownerId = bean.getOwnerId();
		ownerName = bean.getOwnerName();
		ownerPhoneNo = bean.getOwnerPhoneNo();
		ownerAddress = bean.getOwnerAddress();
		
		try {
			//call getConnection() method
			con = ConnectionManager.getConnection();
			
			//3. create statement
			ps = con.prepareStatement("UPDATE owner SET ownerName=?, ownerPhoneNo=?, ownerAddress=? WHERE ownerId=?");
			ps.setString(1, ownerName);
			ps.setString(2, ownerPhoneNo);
			ps.setString(3, ownerAddress);
			ps.setInt(4, ownerId);
			
			//4. execute query
			ps.executeUpdate();
			
			System.out.println("Succesfully updated");
			
			//5. close connection
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
