package appointment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ListAppointmentController
 */
@WebServlet("/ListAppointmentController")
public class ListAppointmentController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private AppointmentDAO dao;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListAppointmentController() {
		super();
		dao = new AppointmentDAO();
		
		//TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		request.setAttribute("appointment", AppointmentDAO.getAllAppointment());
		RequestDispatcher view = request.getRequestDispatcher("appointment/app-list.jsp");
		view.forward(request,  response);
	}
}
