package com.acorn.project.point;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.user.User;
import com.acorn.project.user.UserServiceI;

@Controller
@RequestMapping("/point/*")
public class PointController {
	@Inject
	PointServiceI service;
	
	@Inject
	UserServiceI userService;
	
	@RequestMapping("showMyPoint.do")
	public ModelAndView showMyPoint(HttpSession session) {
	    ModelAndView mv = new ModelAndView();
	    User user = (User) session.getAttribute("user");

	    if (user != null) {
	        try {
	            String userCode = user.getUserCode();
	            List<Point> pointList = service.getPointOne(userCode);

	            // 시간순으로 정렬
	            Collections.sort(pointList, new Comparator<Point>() {
	                @Override
	                public int compare(Point p1, Point p2) {
	                    return p1.getPointDate().compareTo(p2.getPointDate());
	                }
	            });

	            // 잔여 포인트 계산
	            int remainingPoints = 0; // 시작 포인트는 0에서 시작
	            for (Point point : pointList) {
	                if (point.getPointStatus() == 1) { // 충전
	                    remainingPoints += point.getPointAmount();
	                } else if (point.getPointStatus() == 2) { // 환전
	                    remainingPoints -= point.getPointAmount();
	                }
	                point.setRemainingPoints(remainingPoints);
	            }

	            mv.addObject("pointList", pointList);
	            mv.setViewName("point/showMyPoint");
	        } catch (Exception e) {
	            e.printStackTrace();
	            mv.setViewName("errorPage");
	            mv.addObject("message", "Error occurred while fetching user points.");
	        }
	    } else {
	        mv.setViewName("user/login");
	        mv.addObject("message", "Login");
	    }

	    return mv;
	}


	
	@RequestMapping("pointCharge.do")
	public String pointCharge(HttpSession session, Model model) {
	    User user = (User)session.getAttribute("user");
	    if(user != null) {
	        model.addAttribute("user", user);
	        return "point/pointCharge";
	    } else {
	        return "redirect:/user/login.do";
	    }
	}
	
	@RequestMapping("charge_process.do")
	public ModelAndView chargeProcess(@RequestParam int pointAmount, HttpSession session) {
	    ModelAndView mv = new ModelAndView();
	    try {
	        User user = (User) session.getAttribute("user");
	        if (user != null) {
	            int result = service.buyPoint(pointAmount, user.getUserCode());
	            if (result > 0) {
	                userService.updatePoint(pointAmount, user);

	                user = userService.getUserById(user.getUserId());
	                session.setAttribute("user", user);

	                mv.addObject("message", "포인트가 성공적으로 충전되었습니다.");
	                mv.setViewName("redirect:/point/showMyPoint.do");
	            } else {
	                mv.addObject("errorMessage", "포인트 충전에 실패하였습니다.");
	                mv.setViewName("redirect:/point/pointCharge.do");
	            }
	        } else {
	            mv.addObject("errorMessage", "로그인 후 이용해주세요.");
	            mv.setViewName("redirect:/user/login.do");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mv.addObject("errorMessage", "포인트 충전 중 오류가 발생하였습니다.");
	        mv.setViewName("redirect:/point/showMyPoint.do");
	    }
	    return mv;
	}
	
	
	
	@RequestMapping("pointExchange.do")
	public String pointExchange(HttpSession session, Model model) {
	    User user = (User) session.getAttribute("user");
	    if (user != null) {
	        model.addAttribute("user", user);
	        return "point/pointExchange";
	    } else {
	        return "redirect:/user/login.do";
	    }
	}

	@RequestMapping("exchange_process.do")
	public ModelAndView exchangeProcess(@RequestParam int exchangeAmount, HttpSession session) {
	    ModelAndView mv = new ModelAndView();
	    try {
	        User user = (User) session.getAttribute("user");
	        if (user != null) {
	            if (user.getUserPoint() >= exchangeAmount) {
	                int result = service.pointExchange(exchangeAmount, user.getUserCode());
	                if (result > 0) {
	                    userService.updatePoint(-exchangeAmount, user);

	                    user = userService.getUserById(user.getUserId());
	                    session.setAttribute("user", user);

	                    mv.addObject("message", "포인트를 환전하였습니다.");
	                    mv.setViewName("redirect:/point/showMyPoint.do");
	                } else {
	                    mv.addObject("errorMessage", "포인트 환전에 실패하였습니다.");
	                    mv.setViewName("redirect:/point/pointExchange.do");
	                }
	            } else {
	                mv.addObject("errorMessage", "포인트가 부족합니다.");
	                mv.setViewName("redirect:/point/pointExchange.do");
	            }
	        } else {
	            mv.addObject("errorMessage", "로그인 후 이용해주세요.");
	            mv.setViewName("redirect:/user/login.do");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mv.addObject("errorMessage", "포인트 환전 중 오류가 발생하였습니다.");
	        mv.setViewName("redirect:/point/showMyPoint.do");
	    }
	    return mv;
	}

}
