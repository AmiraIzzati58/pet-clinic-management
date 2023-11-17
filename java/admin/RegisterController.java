package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        dao = new AdminDAO();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Admin a = new Admin();
		
		a.setAdminEmail(request.getParameter("adminEmail"));
		a.setAdminUsername(request.getParameter("adminUsername"));
		a.setAdminPassword(request.getParameter("adminPassword"));

		a = AdminDAO.getAdmin(a);
		//check if user exists
		if(!a.isValid()){
		   try {
		       //if user not exist, add/register the user
				dao.registerAdmin(a);
		   } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		   }
		        //redirect to login page
		        response.sendRedirect("login.jsp");
		 }         
	}

}
