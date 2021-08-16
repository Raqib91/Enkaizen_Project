package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.TodoDao;
import com.raqib91.Entities.TODO;

@Controller
public class AllControllers {

	@RequestMapping("/login")
	public void LoginDao(HttpServletRequest req, HttpServletResponse res) throws IOException {

		String username = req.getParameter("role");
		String passwsord = req.getParameter("pass");

		if (username.equals("User") && passwsord.equals("user")) {
			HttpSession session = req.getSession();
			session.setAttribute("roleUser", username);
			session.setAttribute("passUser", passwsord);

			res.sendRedirect("userDashboard.jsp");
		}

		else if (username.equals("Admin") && passwsord.equals("admin")) {
			HttpSession session = req.getSession();
			session.setAttribute("roleAdmin", username);
			session.setAttribute("passAdmin", passwsord);

			res.sendRedirect("adminDashboard.jsp");
		}

		else {
			res.sendRedirect("index.jsp");
		}

	}

	@RequestMapping("/userLogout")
	public void UserLogoutDao(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("roleUser");

		res.sendRedirect("index.jsp");
	}

	@RequestMapping("/adminLogout")
	public void AdminLogoutDao(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("roleAdmin");

		res.sendRedirect("index.jsp");
	}

	@RequestMapping("/createTodo")
	public void createTODO(HttpServletRequest req, HttpServletResponse res, @ModelAttribute TODO t) throws IOException {

		ApplicationContext context = getContext();
		TodoDao t1 = context.getBean("todoDao", TodoDao.class);
		t1.CreateTODO(t);

		((AbstractApplicationContext) context).close();

		res.sendRedirect("adminDashboard.jsp");

	}

	@RequestMapping("/adminUpdateTodo")
	public void AdminUpdateTODO(HttpServletRequest req, HttpServletResponse res, @ModelAttribute TODO t)
			throws IOException {

		ApplicationContext context = getContext();
		TodoDao t1 = context.getBean("todoDao", TodoDao.class);
		t1.UpdateTODO(t);

		((AbstractApplicationContext) context).close();

		res.sendRedirect("adminDashboard.jsp");

	}

	@RequestMapping("/userUpdateTodo")
	public void UserUpdateTODO(HttpServletRequest req, HttpServletResponse res, @ModelAttribute TODO t)
			throws IOException {

		ApplicationContext context = getContext();
		TodoDao t1 = context.getBean("todoDao", TodoDao.class);
		t1.UpdateTODO(t);

		((AbstractApplicationContext) context).close();

		res.sendRedirect("userDashboard.jsp");

	}

	@RequestMapping("/deleteTodo")
	public void deleteTODO(HttpServletRequest req, HttpServletResponse res) throws IOException {

		int id = Integer.parseInt(req.getParameter("todoId"));

		ApplicationContext context = getContext();
		TodoDao t1 = context.getBean("todoDao", TodoDao.class);
		t1.DeleteTODO(id);

		((AbstractApplicationContext) context).close();

		res.sendRedirect("adminDashboard.jsp");

	}

	public ApplicationContext getContext() {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/raqib91/Dao/ormConfig.xml");
		return context;
	}

}
