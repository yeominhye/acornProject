package com.acorn.project.point;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.sql.Timestamp;


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
    public ModelAndView showMyPoint(HttpSession session, 
                                    @RequestParam(value = "startDate", required = false) String startDate,
                                    @RequestParam(value = "endDate", required = false) String endDate) {
        ModelAndView mv = new ModelAndView();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            try {
                String userCode = user.getUserCode();
                List<Map<String, Object>> pointList;

                if (startDate != null && endDate != null) {
                    pointList = service.getPointsWithinDateRange(userCode, startDate, endDate);
                } else {
                    pointList = service.getPointOne(userCode);
                }

                Collections.sort(pointList, new Comparator<Map<String, Object>>() {
                    @Override
                    public int compare(Map<String, Object> p1, Map<String, Object> p2) {
                        return ((Timestamp) p1.get("pointDate")).compareTo((Timestamp) p2.get("pointDate"));
                    }
                });

                int remainingPoints = 0;
                for (Map<String, Object> point : pointList) {
                    int pointStatus = (int) point.get("pointStatus");
                    int pointAmount = (int) point.get("pointAmount");

                    if (pointStatus == 1 || pointStatus == 3) {
                        remainingPoints += pointAmount;
                    } else if (pointStatus == 0 || pointStatus == 2) {
                        remainingPoints -= pointAmount;
                    }
                    point.put("remainingPoints", remainingPoints);
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

	@RequestMapping("showMyEarnedPoint.do")
	public ModelAndView showMyEarnedPoint(HttpSession session, 
	                                      @RequestParam(value = "startDate", required = false) String startDate,
	                                      @RequestParam(value = "endDate", required = false) String endDate) {
        ModelAndView mv = new ModelAndView();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            try {
                String userCode = user.getUserCode();
                List<Map<String, Object>> pointList;

                if (startDate != null && endDate != null) {
                    pointList = service.getPointsWithinDateRange(userCode, startDate, endDate);
                } else {
                    pointList = service.getPointOne(userCode);
                }

                Collections.sort(pointList, new Comparator<Map<String, Object>>() {
                    @Override
                    public int compare(Map<String, Object> p1, Map<String, Object> p2) {
                        return ((Timestamp) p1.get("pointDate")).compareTo((Timestamp) p2.get("pointDate"));
                    }
                });

                int remainingPoints = 0;
                for (Map<String, Object> point : pointList) {
                    int pointStatus = (int) point.get("pointStatus");
                    int pointAmount = (int) point.get("pointAmount");

                    if (pointStatus == 1 || pointStatus == 3) {
                        remainingPoints += pointAmount;
                    } else if (pointStatus == 0 || pointStatus == 2) {
                        remainingPoints -= pointAmount;
                    }
                    point.put("remainingPoints", remainingPoints);
                }

                mv.addObject("pointList", pointList);
                mv.setViewName("point/showMyEarnedPoint");
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
	
	@RequestMapping("showMyUsePoint.do")
    public ModelAndView showMyUsePoint(HttpSession session, 
                                    @RequestParam(value = "startDate", required = false) String startDate,
                                    @RequestParam(value = "endDate", required = false) String endDate) {
        ModelAndView mv = new ModelAndView();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            try {
                String userCode = user.getUserCode();
                List<Map<String, Object>> pointList;

                if (startDate != null && endDate != null) {
                    pointList = service.getPointsWithinDateRange(userCode, startDate, endDate);
                } else {
                    pointList = service.getPointOne(userCode);
                }

                Collections.sort(pointList, new Comparator<Map<String, Object>>() {
                    @Override
                    public int compare(Map<String, Object> p1, Map<String, Object> p2) {
                        return ((Timestamp) p1.get("pointDate")).compareTo((Timestamp) p2.get("pointDate"));
                    }
                });

                int remainingPoints = 0;
                for (Map<String, Object> point : pointList) {
                    int pointStatus = (int) point.get("pointStatus");
                    int pointAmount = (int) point.get("pointAmount");

                    if (pointStatus == 1 || pointStatus == 3) {
                        remainingPoints += pointAmount;
                    } else if (pointStatus == 0 || pointStatus == 2) {
                        remainingPoints -= pointAmount;
                    }
                    point.put("remainingPoints", remainingPoints);
                }

                mv.addObject("pointList", pointList);
                mv.setViewName("point/showMyUsePoint");
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
