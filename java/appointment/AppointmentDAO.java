package appointment;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import db.connection.ConnectionManager;

import Pet.*;
import admin.*;
import Owner.*;
import veterinar.*;

public class AppointmentDAO {
	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	
	double servicePrice;
	static int appId, petId,ownerId,vetId,adminId;
	String appDate,appTime,serviceType,appStatus;
	String petName,petDOB,petBreed,petColor,petSex;
	String ownerName,ownerPhoneNo,ownerAddress;
	
	//add Appointment
	public void add(AppointmentModel app) {
		appDate = app.getAppDate();
		appTime = app.getAppTime();
		serviceType = app.getServiceType();
		servicePrice = app.getServicePrice();
		appStatus = app.getAppStatus();
		vetId = app.getVetId();
		petId = app.getPetId();
		adminId = app.getAdminId();
				
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement("INSERT INTO appointment(appDate,appTime,serviceType,servicePrice,appStatus, vetId, petId, adminId)VALUES(?,?,?,?,?,?,?,?)");
			
			ps.setString(1,appDate);
			ps.setString(2,appTime);
			ps.setString(3, serviceType);
			ps.setDouble(4, servicePrice);
			ps.setString(5, appStatus);
			ps.setInt(6, vetId);
			ps.setInt(7, petId);
			ps.setInt(8, adminId);
			
			ps.executeUpdate();
			System.out.println("Successfully inserted");

			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Appointment not inserted");

		}
	}
	
		
		//list all appointment
		public static List<AppointmentModel> getAllAppointment(){
			List<AppointmentModel> appointment = new ArrayList<AppointmentModel>();
			try {
				con = ConnectionManager.getConnection();
				
				stmt = con.createStatement();
				
				rs = stmt.executeQuery("SELECT * FROM appointment ORDER BY appId");
				
				while(rs.next()) {
					AppointmentModel appt = new AppointmentModel();
					appt.setAppId(rs.getInt("appId"));
					appt.setAppDate(rs.getString("appDate"));
					appt.setAppTime(rs.getString("appTime"));
					appt.setServiceType(rs.getString("serviceType"));
					appt.setServicePrice(rs.getDouble("servicePrice"));
					appt.setAppStatus(rs.getString("appStatus"));
					appt.setVetId(rs.getInt("vetId"));
					appt.setPetId(rs.getInt("petId"));
					appt.setAdminId(rs.getInt("adminId"));
					appt.setVet(VetDAO.getVetById(rs.getInt("vetId")));
					appt.setPet(PetDAO.getPetByPetId(rs.getInt("petId")));
					appt.setAdmin(AdminDAO.getAdminById(rs.getInt("adminId")));

					
					appointment.add(appt);
					
				}
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			return appointment;
		}
		
		//get appointment by id 
		public static AppointmentModel getAppointmentById(int appId) {
			AppointmentModel apt = new AppointmentModel();
			try {
				con = ConnectionManager.getConnection();
				
				ps = con.prepareStatement("SELECT * FROM appointment WHERE appId=?");
				
				ps.setInt(1, appId);
						
				rs = ps.executeQuery();
				
				if(rs.next() ) {
					apt.setAppId(rs.getInt("appId"));
					apt.setAppDate(rs.getString("appDate"));
					apt.setAppTime(rs.getString("appTime"));
					apt.setServiceType(rs.getString("serviceType"));
					apt.setServicePrice(rs.getDouble("servicePrice"));
					apt.setAppStatus(rs.getString("appStatus"));
					apt.setVetId(rs.getInt("vetId"));
					apt.setPetId(rs.getInt("petId"));
					apt.setAdminId(rs.getInt("adminId"));
					
					apt.setVet(VetDAO.getVetById(rs.getInt("vetId")));
					apt.setPet(PetDAO.getPetByPetId(rs.getInt("petId")));
					apt.setAdmin(AdminDAO.getAdminById(rs.getInt("adminId")));
					
				}
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			
			return apt;
		}
		
		//total bill
		public static AppointmentModel getTotal(int appId) {
			AppointmentModel a = new AppointmentModel();
			try {
				con = ConnectionManager.getConnection();
				
				ps = con.prepareStatement("SELECT servicePrice FROM appointment WHERE appId=?");
				ps.setInt(1, appId);
				rs = ps.executeQuery();
				
				double charge = 40;
				if(rs.next()) {
					a.setServicePrice(rs.getDouble("servicePrice") + charge);					
				}
				
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			
			return a;
		}
		//delete appointment
		public void deleteAppointment(int appId) {
			try {
				con = ConnectionManager.getConnection();
				
				ps=con.prepareStatement("DELETE FROM appointment where appId=?");
				ps.setInt(1, appId);
				ps.executeUpdate();
				
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
		}
		
		//update appointment
		public void updateAppointment(AppointmentModel ap) {
			appId = ap.getAppId();
			appDate = ap.getAppDate();
			appTime = ap.getAppTime();
			serviceType = ap.getServiceType();
			servicePrice = ap.getServicePrice();
			appStatus = ap.getAppStatus();
			vetId = ap.getVetId();
			petId = ap.getPetId();
			adminId = ap.getAdminId();
			
			String search = "UPDATE appointment SET appDate=?, appTime =?, serviceType=?,servicePrice=?, appStatus=?, vetId=? WHERE appId=?";
				try {
					con = ConnectionManager.getConnection();
					ps = con.prepareStatement(search);
					ps.setString(1, appDate);
					ps.setString(2, appTime);
					ps.setString(3, serviceType);
					ps.setDouble(4, servicePrice);
					ps.setString(5, appStatus);
					ps.setInt(6, vetId);
					ps.setInt(7, appId);
					
					ps.executeUpdate();
					
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println(e);

				}
			
		}
		
}
