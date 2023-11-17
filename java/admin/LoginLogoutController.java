package admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginLogoutController")
public class LoginLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAO dao;
	HttpSession session;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginLogoutController() {
		super();
		dao = new AdminDAO();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//get the current session
			HttpSession session = request.getSession(true);
			//set current session to null.
			System.out.print("okay nice 21");

			session.setAttribute("sessionEmail", null);
			//destroy session
			session.invalidate();
			//redirect to login page
			response.sendRedirect("login.jsp");
		}catch (Exception ex) {
			System.out.println(ex);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			Admin admin = new Admin();
			//retrieve and set email and password
			admin.setAdminEmail(request.getParameter("adminEmail"));
			admin.setAdminPassword(request.getParameter("adminPassword"));

			admin = AdminDAO.login(admin);
			//set user session if user is valid
			if(admin.isValid()){				
				System.out.print("okay nice");
				session = request.getSession(true);
				session.setAttribute("sessionId", admin.getAdminId());
				System.out.println(admin.getAdminId());
				
				session.setAttribute("sessionEmail", admin.getAdminEmail());  //set current session based on email
				session.setAttribute("sessionUsername", admin.getAdminUsername()); 				
				
				request.setAttribute("us", AdminDAO.getAdminByEmail(admin.getAdminEmail())); 				
				request.setAttribute("ag", AdminDAO.getAdminById(admin.getAdminId()));
				RequestDispatcher view = request.getRequestDispatcher("index.jsp"); 	 // supplier page
				view.forward(request, response);
				
			}
			//redirect to invalidLoggin.jsp if user is not valid
			else{
				response.sendRedirect("invalid-login.jsp");
			}		
		}

		catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
		}
	}

}
