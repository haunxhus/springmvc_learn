package com.springmvc.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springmvc.model.Student;
import com.springmvc.model.StudentLogin;
import com.springmvc.service.StudentService;

@Controller
@SessionAttributes("student")
public class StudentController {
	private static final Logger logger = LoggerFactory
            .getLogger(StudentController.class);
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="/test/signup", method=RequestMethod.GET)
	public String signup(Model model) {
		Student student = new Student();
		model.addAttribute("student", student);
		return "signup";
	}
	
	@RequestMapping(value="/test/signup", method=RequestMethod.POST)
	public String signup(@ModelAttribute("student") Student student, Model model) {
		if(studentService.getStudentByUserName(student.getUserName())) {
			model.addAttribute("message", "User Name exists. Try another user name");
			return "signup";
		} else {
			studentService.insertStudent(student);
			model.addAttribute("message", "Saved student details");
			return "redirect:login.html";
		}
	}
	
	@RequestMapping(value="/test/mains", method=RequestMethod.GET)
	public String login(Model model) {
		StudentLogin studentLogin = new StudentLogin();
		model.addAttribute("studentLogin", studentLogin);
		return "login";
	}
	
	@RequestMapping(value="/test/logins", method=RequestMethod.POST)
	public String login(@ModelAttribute("studentLogin") StudentLogin studentLogin) {
		boolean found = studentService.getStudentByLogin(studentLogin.getUserName(), studentLogin.getPassword());
		if (found) {				
			return "success";
		} else {				
			return "failure";
		}
	}
	
	@RequestMapping(value = "/test/loginErrors", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";

	}
}
