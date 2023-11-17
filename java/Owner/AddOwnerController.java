package Owner;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddOwnerController
 */
@WebServlet("/AddOwnerController")
public class AddOwnerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OwnerDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOwnerController() {
        super();
        dao = new OwnerDAO();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setAttribute("owners",OwnerDAO.getAllOwners());
				RequestDispatcher view = request.getRequestDispatcher("appointment/app-addpet-returnedowner.jsp");
				view.forward(request,response);

	}    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Owner o = new Owner();
		
		o.setOwnerName(request.getParameter("ownerName"));
		o.setOwnerPhoneNo(request.getParameter("ownerPhoneNo"));
		o.setOwnerAddress(request.getParameter("ownerAddress"));
		
		
		dao.addOwner(o); //invoke method addOwner() in OwnerDAO
		
		request.setAttribute("owners",OwnerDAO.getAllOwners());
		RequestDispatcher view = request.getRequestDispatcher("appointment/app-addpet.jsp");
		view.forward(request,response);

	}
}
