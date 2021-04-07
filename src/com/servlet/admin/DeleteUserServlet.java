package com.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/admin/users/delete")
public class DeleteUserServlet extends HttpServlet {
	private UserDAO userDAO;
    public DeleteUserServlet() {
        super();
        
        this.userDAO = new UserDAO();
    }

	protected void doGet(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		
		if (idStr == null) {
			// 400 Bad Request
		}

		int id = Integer.parseInt(idStr);
		User entity = new User();
		entity.setId(id);
		
		 this.userDAO.delete(entity);
		
		response.sendRedirect(request.getContextPath() + "/admin/users");
	}
}
