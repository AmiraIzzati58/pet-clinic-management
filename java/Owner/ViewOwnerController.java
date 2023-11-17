package Owner;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ViewOwnerController
 */
@WebServlet("/ViewOwnerController")
public class ViewOwnerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OwnerDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOwnerController() {
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
		RequestDispatcher view = request.getRequestDispatcher("owner/owner-view.jsp");
		view.forward(request,response);
	}

	public OwnerDAO getDao() {
		return dao;
	}

	public void setDao(OwnerDAO dao) {
		this.dao = dao;
	}
}
