package appointment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import veterinar.VetDAO;

/**
 * Servlet implementation class UpdateAppointmentController
 */
@WebServlet("/UpdateAppointmentController")
public class UpdateAppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AppointmentDAO dao;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateAppointmentController() {
		super();
		dao = new AppointmentDAO();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub 
		int appId = Integer.parseInt(request.getParameter("appId"));
		request.setAttribute("ap", AppointmentDAO.getAppointmentById(appId));
		request.setAttribute("vets", VetDAO.getAllVets());
		RequestDispatcher view = request.getRequestDispatcher("appointment/app-update.jsp");
		view.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//TODO Auto-generated method stub
		
		AppointmentModel ap = new AppointmentModel();
		
		ap.setAppId(Integer.parseInt(request.getParameter("appId")));
		ap.setAppDate(request.getParameter("appDate"));
		ap.setAppTime(request.getParameter("appTime"));
		ap.setServiceType(request.getParameter("serviceType"));
		ap.setServicePrice(Double.parseDouble(request.getParameter("servicePrice")));
		ap.setAppStatus(request.getParameter("appStatus"));
		ap.setVetId(Integer.parseInt(request.getParameter("vetId")));		
		
		dao.updateAppointment(ap);
		
		request.setAttribute("appointment", AppointmentDAO.getAllAppointment());
		RequestDispatcher view = request.getRequestDispatcher("appointment/app-list.jsp");
		view.forward(request,  response);
		
	}
}
