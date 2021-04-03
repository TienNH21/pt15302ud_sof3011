package com.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/admin/users")
public class UserServlet extends HttpServlet {
	private UserDAO userDAO;

	public UserServlet() {
		this.userDAO = new UserDAO();
	}

	@Override
	protected void doGet(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {
		
		String pageStr = request.getParameter("page");
		String limitStr = request.getParameter("limit");
		
		int page = pageStr == null ? 1 : Integer.parseInt(pageStr);
		int limit = limitStr == null ? 10 : Integer.parseInt(limitStr);

		int offset = limit * (page - 1);
		List<User> listUser = this.userDAO.paginate(offset, limit);
		
		request.setAttribute("listUser", listUser);
		request.setAttribute("page", page);

		request.getRequestDispatcher("/views/admin/users/index.jsp")
		.forward(request, response);
	}
}