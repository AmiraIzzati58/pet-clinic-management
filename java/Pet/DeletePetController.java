package Pet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class DeletePetController
 */
@WebServlet("/DeletePetController")

public class DeletePetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PetDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePetController() {
        super();
        dao = new PetDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int petId = Integer.parseInt(request.getParameter("petId"));
		dao.deletePet(petId);	
		request.setAttribute("pets",PetDAO.getAllPets());
		RequestDispatcher view = request.getRequestDispatcher("pet/pet-list.jsp");
		view.forward(request,response);
	}

}
