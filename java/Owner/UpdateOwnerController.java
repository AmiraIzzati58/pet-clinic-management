package Owner;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class UpdateOwnerController
 */
@WebServlet("/UpdateOwnerController")
public class UpdateOwnerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OwnerDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOwnerController() {
        super();
        dao = new OwnerDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ownerId = Integer.parseInt(request.getParameter("ownerId"));
		request.setAttribute("o",OwnerDAO.getOwnerById(ownerId));
		RequestDispatcher view = request.getRequestDispatcher("owner/owner-update.jsp");
		view.forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Owner o = new Owner();
		
		o.setOwnerId(Integer.parseInt(request.getParameter("ownerId")));
		o.setOwnerName(request.getParameter("ownerName"));
		o.setOwnerPhoneNo(request.getParameter("ownerPhoneNo"));
		o.setOwnerAddress(request.getParameter("ownerAddress"));
	
		dao.updateOwner(o); //invoke method updateOwner() in OwnerDAO
		
		request.setAttribute("owners",OwnerDAO.getAllOwners());
		RequestDispatcher view = request.getRequestDispatcher("owner/owner-list.jsp");
		view.forward(request,response);

	}

}
