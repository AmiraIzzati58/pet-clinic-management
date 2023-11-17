package appointment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ViewBillController
 */
@WebServlet("/ViewBillController")
public class ViewBillController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AppointmentDAO dao;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewBillController() {
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
		request.setAttribute("a", AppointmentDAO.getTotal(appId));
		RequestDispatcher view = request.getRequestDispatcher("appointment/app-view.jsp");
		view.forward(request,  response);
	}
}
