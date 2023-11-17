package Pet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddPetController
 */
@WebServlet("/AddPetController")
public class AddPetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PetDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPetController() {
        super();
        dao = new PetDAO();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Pet p = new Pet();
		
		p.setPetName(request.getParameter("petName"));
		p.setPetDOB(request.getParameter("petDOB"));
		p.setPetBreed(request.getParameter("petBreed"));
		p.setPetColor(request.getParameter("petColor"));
		p.setPetSex(request.getParameter("petSex"));
		p.setOwnerId(Integer.parseInt(request.getParameter("ownerId")));
		
		dao.addController(p);
		
		request.setAttribute("pets",PetDAO.getAllPets());
		RequestDispatcher view = request.getRequestDispatcher("appointment/app-addapp.jsp");
		view.forward(request,response);

	}

}
