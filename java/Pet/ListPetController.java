package Pet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ListPetController
 */
@WebServlet("/ListPetController")
public class ListPetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PetDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListPetController() {
        super();
        setDao(new PetDAO());
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("pets",PetDAO.getAllPets());
		RequestDispatcher view = request.getRequestDispatcher("pet/pet-list.jsp");
		view.forward(request,response);

	}

	
	public PetDAO getDAO() {
		return dao;
	}
	
	public void setDao(PetDAO dao) {
		this.dao = dao;
	}

}
