package com.springmvc.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public String printWelcome(ModelMap model, Principal principal) {
//
//		String name = principal.getName();
//		model.addAttribute("username", name);
//		return "main_page";
//
//	}
//
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login(ModelMap model) {
//
//		return "login_page";
//
//	}
//
//	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
//	public String loginError(ModelMap model) {
//		model.addAttribute("error", "true");
//		return "login_page";
//
//	}
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public ModelAndView welcomePage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form & Remember Me");
		model.addObject("message", "This is default page!");
		
		model.setViewName("home");
		return model;

	}
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form & Remember Me");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}
	/**
	 * This update page is for user login with password only.
	 * If user is login via remember me cookie, send login to ask for password again.
	 * To avoid stolen remember me cookie to update info
	 */
	@RequestMapping(value = "/admin/update**", method = RequestMethod.GET)
	public ModelAndView updatePage(HttpServletRequest request) {

		ModelAndView model = new ModelAndView();

		if (isRememberMeAuthenticated()) {
			//send login for update
			setRememberMeTargetUrlToSession(request);
			model.addObject("loginUpdate", true);
			model.setViewName("/login");
			
		} else {
			model.setViewName("update");
		}

		return model;

	}
	/**
	 * both "normal login" and "login for update" shared this form.
	 * 
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
	  @RequestParam(value = "logout", required = false) String logout, 
          HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
			
			//login form for update page
            //if login error, get the targetUrl from session again.
			String targetUrl = getRememberMeTargetUrlFromSession(request);
			System.out.println(targetUrl);
			if(StringUtils.hasText(targetUrl)){
				model.addObject("targetUrl", targetUrl);
				model.addObject("loginUpdate", true);
			}
			
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	// for 403 access denied page
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accesssDenied(Principal user) {

		ModelAndView model = new ModelAndView();

		if (user != null) {
			model.addObject("user", user.getName());
		} else {
			model.addObject("user", "Anomous");
		}

		model.setViewName("accessDenied");
		return model;

	}
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/common", method = RequestMethod.GET)
	public ModelAndView common() {
		ModelAndView model = new ModelAndView();
		model.setViewName("common");
		return model;
	}
	/**
	 * Check if user is login by remember me cookie, refer
	 * org.springframework.security.authentication.AuthenticationTrustResolverImpl
	 */
	private boolean isRememberMeAuthenticated() {

		Authentication authentication = 
                    SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			return false;
		}

		return RememberMeAuthenticationToken.class.isAssignableFrom(authentication.getClass());
	}
	
	/**
	 * save targetURL in session
	 */
	private void setRememberMeTargetUrlToSession(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.setAttribute("targetUrl", "/admin/update");
		}
	}

	/**
	 * get targetURL from session
	 */
	private String getRememberMeTargetUrlFromSession(HttpServletRequest request){
		String targetUrl = "";
		HttpSession session = request.getSession(false);
		if(session!=null){
			targetUrl = session.getAttribute("targetUrl")==null?""
                             :session.getAttribute("targetUrl").toString();
		}
		return targetUrl;
	}
}
