package appointment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Pet.Pet;
import veterinar.VetDAO;
import Owner.Owner;

/**
 * Servlet implementation class AddAppointmentController
 */
@WebServlet("/AddAppointmentController")
public class AddAppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AppointmentDAO dao;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAppointmentController() {
		super();
		dao = new AppointmentDAO();
		
		//TODO Auto-generated constructor stub
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		AppointmentModel ap = new AppointmentModel();
		
		ap.setAppDate(request.getParameter("appDate"));
		ap.setAppTime(request.getParameter("appTime"));
		ap.setServiceType(request.getParameter("serviceType"));
		ap.setServicePrice(Double.parseDouble(request.getParameter("servicePrice")));
		ap.setAppStatus(request.getParameter("appStatus"));
		ap.setVetId(Integer.parseInt(request.getParameter("vetId")));
		ap.setPetId(Integer.parseInt(request.getParameter("petId")));
		ap.setAdminId(Integer.parseInt(request.getParameter("adminId")));
		
		dao.add(ap);
		request.setAttribute("appointment", AppointmentDAO.getAllAppointment());
		RequestDispatcher view = request.getRequestDispatcher("appointment/app-list.jsp");
		view.forward(request, response);
		
	}
}
