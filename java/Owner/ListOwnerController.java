package Owner;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ListOwnerController
 */
@WebServlet("/ListOwnerController")
public class ListOwnerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OwnerDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListOwnerController() {
        super();
        setDao(new OwnerDAO());
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("owners",OwnerDAO.getAllOwners());
		RequestDispatcher view = request.getRequestDispatcher("owner/owner-list.jsp");
		view.forward(request,response);
	}

	public OwnerDAO getDao() {
		return dao;
	}

	public void setDao(OwnerDAO dao) {
		this.dao = dao;
	}

}