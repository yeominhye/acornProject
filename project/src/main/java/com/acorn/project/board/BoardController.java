package com.acorn.project.board;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.project.archive.Archive;
import com.acorn.project.archive.ArchiveServiceI;
import com.acorn.project.comment.Comment;
import com.acorn.project.comment.CommentServiceI;
import com.acorn.project.like.Like;
import com.acorn.project.like.LikeServiceI;
import com.acorn.project.report.Report;
import com.acorn.project.report.ReportServiceI;
import com.acorn.project.user.User;
import com.acorn.project.user.UserServiceI;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardServiceI boardService;
	
	@Autowired
	UserServiceI userService;
	
	@Autowired
	CommentServiceI commentService;
	
	@Autowired
	LikeServiceI likeService;
	
	@Autowired
	ArchiveServiceI archiveService;
	
	@Autowired
	ReportServiceI reportService;

	
	
	private String fileDir ="c:\\test\\upload\\";
	
	@RequestMapping(value = "/free", method=RequestMethod.GET)
	public String BoardListType(String type, Model model, @RequestParam(defaultValue = "1") int page) {

		int board_type = Integer.parseInt(type);
		List<Board> freeBoardList = boardService.getBoardBytype(board_type ,page);
		model.addAttribute("freeBoardList",freeBoardList);
		model.addAttribute("type",board_type);
		
		SearchCondition search = new SearchCondition(null,null,0);
		model.addAttribute("search", search);

		int totRecords = boardService.selectTotalCount(board_type);
		int pageSize = 15;
		PagingHandler handler = new PagingHandler( page , totRecords ,pageSize);
		model.addAttribute("paging", handler);
		return "board/freeboardList";
	}
	
	@RequestMapping(value="/free/search", method = RequestMethod.GET)
	public String Searchboard (SearchCondition search, @RequestParam(defaultValue = "1") int page, Model model) {
		
		List<Board> freeBoardList = boardService.getList(search,page);
		model.addAttribute("freeBoardList",freeBoardList);
		model.addAttribute("search",search);
		
		int pageSize=15;	
		int  start  =   (page  -1) *pageSize+1;
		int totRecords = boardService.getListCount(search);
		search.setStart(start);
		PagingHandler handler = new PagingHandler(page, totRecords, pageSize);
		model.addAttribute("paging",handler);
		return "board/freeboardList";
	}

	
	@RequestMapping(value="/free/reg", method=RequestMethod.GET)
	public String regBoard( Board board, HttpSession session, Model model) {
	    User user =(User)session.getAttribute("user");
	    if(user != null) {
            return "board/freeboardForm";
	    } 
	    return "redirect:/user/login.do";
	}
	
	
	@RequestMapping(value="/free/reg", method=RequestMethod.POST)
	public String regBoard_sub(Board board) {
		boardService.regBoard(board);
		System.out.println(board);
		return "redirect:/board/free?type=-1";
	}
	
	
    @GetMapping("/free/{code}")
    public String Board(@PathVariable String code, Model model) {
        Board freeboard = boardService.getBoardBycode(code);
        boardService.updateViews(code); //  views 증가
        model.addAttribute("freeboard", freeboard);
        System.out.println(freeboard);
        
        List<Comment> comments = commentService.getCommentByCode(code);
        model.addAttribute("comments", comments);
        
        int count = commentService.count(code);
        model.addAttribute("count", count);
        return "board/freeboardDetail";  
    }
    
    @PostMapping("/free/{code}")
    public ResponseEntity<Map<String, Object>> comment(@PathVariable String code, @RequestBody Comment comment, HttpSession session) {
    	User user = (User) session.getAttribute("user");
        Map<String, Object> response = new HashMap<>();
        
        if (user != null) {
            commentService.register(comment);
            System.out.println(comment);
            response.put("status", "success");
            response.put("message", "Comment posted successfully");
            response.put("redirect", "/project/board/free/"+code);
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "error");
            response.put("message", "User not logged in");
            response.put("redirect", "/project/user/login.do");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }
    
    
    
    @ResponseBody
    @RequestMapping(value = "/free/{code}", method = RequestMethod.PUT)
	public void CommentModi(@PathVariable String code, @RequestBody Comment comment, HttpSession session) {
		commentService.modify(comment);
		System.out.println(comment);
	}
	
    @ResponseBody
	@RequestMapping(value = "/free/{code}", method = RequestMethod.DELETE)
	public void CommentDel(@PathVariable String code, @RequestBody String commentcode, HttpSession session) {
		commentService.delete(commentcode);
		System.out.println(commentcode);
	}
    

    
    @ResponseBody
    @RequestMapping(value = "/free/{code}/likeCheck", method = RequestMethod.POST)
    public int checkLike(@PathVariable String code, @RequestBody Like like, HttpSession session, Model model) {
    	Like check = likeService.checkLike(like);
    	if (check != null) {
    		return 1;
    	}else {
    		return 0;
    	}    		
    }
  
    @ResponseBody
    @RequestMapping(value = "/free/{code}/likes", method = RequestMethod.POST)
    public void incrLike(@PathVariable String code, @RequestBody Like like) {
    	likeService.incrLike(like);
    	  System.out.println("추가"+like);	
    }
    
    @ResponseBody
    @RequestMapping(value = "/free/{code}/likes", method = RequestMethod.DELETE)
    public void decrLike(@PathVariable String code, @RequestBody Like like) {
    	likeService.decrLike(like);
    	System.out.println("삭제"+like);
    }
    
    
    
    @ResponseBody
    @RequestMapping(value = "/free/{code}/archCheck", method = RequestMethod.POST)
    public int checkArch(@PathVariable String code, @RequestBody Archive archive, HttpSession session, Model model) {
    	Archive check = archiveService.checkArch(archive);
    	if (check != null) {
    		return 1;
    	}else {
    		return 0;
    	}
    }
  
    @ResponseBody
    @RequestMapping(value = "/free/{code}/arch", method = RequestMethod.POST)
    public void regArch(@PathVariable String code, @RequestBody Archive archive) {
    	archiveService.insert(archive);
    	  System.out.println("삭제"+archive);
    }
    
    @ResponseBody
    @RequestMapping(value = "/free/{code}/arch", method = RequestMethod.DELETE)
    public void deleteArch(@PathVariable String code, @RequestBody Archive archive) {
    	archiveService.delete(archive);
    	System.out.println("�궘�젣"+archive);
    }
    

	
    @PostMapping("/free/{code}/report")
    public ResponseEntity<Map<String, Object>> regReport(@PathVariable String code, @RequestBody Report report, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> response = new HashMap<>();
        
        if (user != null) {
            reportService.register(report);
            System.out.println(report);
            response.put("status", "success");
            response.put("message", "Comment posted successfully");
            response.put("redirect", "/project/board/free/"+code);
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "error");
            response.put("message", "User not logged in");
            response.put("redirect", "/project/user/login.do");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }
    
	@RequestMapping(value = "/freeboard/{theme}")
	public String BoardListTheme(@PathVariable String theme, Model model) {
		List<Board> freeBoardList = boardService.getBoardBytheme(theme);
		model.addAttribute("freeBoardList",freeBoardList);
		return "board/freeboardList";
	}
	
//	@RequestMapping(value="/my", method = RequestMethod.GET)
//	public String myBoardList(HttpSession session, Model model){
//		User user = (User)session.getAttribute("user");
//		String userId =user.getUserId();
//		List<Board> BoardList = boardService.getBoardByuser(userId);
//		model.addAttribute("BoardList",BoardList);
//		return "/board/myboard";
//	}
	
	
	@ResponseBody
	@RequestMapping(value="/my/scrap", method = RequestMethod.POST)
	public void myBoardScrap(@RequestBody Board board) {
		
	}
	
	
	@RequestMapping(value = "/my/{code}", method = RequestMethod.GET)
	public String myfreeBoard(@PathVariable String code, HttpSession session) {
		Board board = boardService. getBoardBycode(code);
		session.setAttribute("myboard", board);
		
		return "/board/myboardForm";
	}
	
	@RequestMapping(value = "/my/{code}", method = RequestMethod.POST)
	public String boardModi(Board board) {
		boardService.modiBoard(board);
		System.out.println(board);
		
		return "redirect:/board/free/{code}";
	}
	
	
	@RequestMapping(value = "/my/del/{code}", method = RequestMethod.GET)
	public String boardDelete(@PathVariable String code) {
	boardService.delBoard(code);
		return  "redirect:/board/free?type=-1";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		return "/board/faq";
	}
	
	@RequestMapping(value = "/inquiry",method = RequestMethod.GET)
	public String inquiry(HttpSession session,Model model) {
		User user = (User)session.getAttribute("user");	 
	    if(user != null) {
	        return "board/inquiryForm";
	    }
	    return "redirect:/user/login.do";
	
	}

	@RequestMapping(value = "/inquiry",method = RequestMethod.POST)
	public String inquiryReg(BoardVO vo, String boardTitle) throws IllegalStateException, IOException {
	   MultipartFile file = vo.getBoardImg();
	    System.out.println(vo);

	    if (file != null && !file.isEmpty()) {
	        String originalName = file.getOriginalFilename();
	        if (originalName != null && originalName.contains(".")) {
	            String ext = originalName.substring(originalName.lastIndexOf("."));
	            System.out.println(ext);
	            UUID uuid = UUID.randomUUID();
	            String realName = uuid + ext;

	            Board board = new Board(vo.getBoardCode(), vo.getUserCode(), vo.getNickname(), originalName, realName, 
	                    vo.getBoardTitle(), vo.getBoardContent(), vo.getBoardTheme(), vo.getBoardTourdays(),
	                    vo.getBoardWritedate(), vo.getBoardViews(), vo.getBoardPoint(), vo.getBoardType(),0);
	            System.out.println(board);
	            String fullPath = fileDir + realName;
	            file.transferTo(new File(fullPath));

	            boardService.regBoard(board);
	        } else {
	        	System.out.println("파일이 유효하지 않거나 확장자가 없습니다.");
	           
	        }
	    } else {
	    	 System.out.println("파일이 업로드되지 않았습니다.");
	        Board board = new Board(vo.getBoardCode(), vo.getUserCode(), vo.getNickname(), null, null, 
	                vo.getBoardTitle(), vo.getBoardContent(), vo.getBoardTheme(), vo.getBoardTourdays(),
	                vo.getBoardWritedate(), vo.getBoardViews(), vo.getBoardPoint(), vo.getBoardType(),0);
	        boardService.regBoard(board);
	    }

	    return "redirect:/board/faq";
	}
	
	
	@RequestMapping(value = "/my/inquiry{type}",method = RequestMethod.GET)
	public String myInquiryList( @PathVariable int type, HttpSession session,Model model) {
		User user = (User)session.getAttribute("user");
		String userId =user.getUserId();
		List<Board> BoardList = boardService.getInquByuser(userId);
		System.out.println(BoardList);
		
		model.addAttribute("BoardList",BoardList);
		return "/board/inquiryboard";
	}
	

	@RequestMapping(value = "/my/inquiry/detail{code}", method = RequestMethod.GET)
	public String myInquiry(@PathVariable String code, HttpSession session, Model model) {
		Board board = boardService.getBoardBycode(code);
		
		String userId = (String)session.getAttribute("user_id");
		model.addAttribute("myboard", board);
		
		model.addAttribute("userId",userId);
		
		return "/board/answer";
	}
	
	@ResponseBody	
	@RequestMapping( value="/images/{fileName:.*}" , method=RequestMethod.GET)
	public Resource imageDownload(@PathVariable String  fileName) throws MalformedURLException {		
		System.out.println( "fileName: " + fileName);
		return new  UrlResource("file:c:\\test\\upload\\"+ fileName);
		
	}

   /* 종범 추가*/
   @RequestMapping(value = "/route", method = RequestMethod.GET)
   public String festival() {
      return "/board/route";
   }
   
  
   @RequestMapping(value = "/route/post", method = RequestMethod.GET)
   public String createRoute( RouteBoard routeBoard, HttpSession session, Model model) {
	   User user =(User)session.getAttribute("user");
		 
	    if(user != null) {
	     session.setAttribute("dayPlans", null);
        return "board/createRouteForm";
	    } 
	    
	    return "redirect:/user/login.do";
   }

 @RequestMapping(value="/createMap_process.do", method=RequestMethod.POST)
	public String createRoute_process (RouteBoardVO vo, HttpSession session) throws Exception {
	 	System.out.println("촥인"+vo);
	   List<Day> dayPlans = (List<Day>) session.getAttribute("dayPlans");
	   MultipartFile file = vo.getBoardImg();
	    System.out.println(vo);

	    if (file != null && !file.isEmpty()) {
	        String originalName = file.getOriginalFilename();
	        if (originalName != null && originalName.contains(".")) {
	            String ext = originalName.substring(originalName.lastIndexOf("."));
	            System.out.println(ext);
	            UUID uuid = UUID.randomUUID();
	            String realName = uuid + ext;

	            RouteBoard routeBoard = new RouteBoard(vo.getBoardCode(), vo.getUserCode(), vo.getNickname(), originalName, realName, 
	                    vo.getBoardTitle(), vo.getBoardContent(), vo.getBoardTheme(), vo.getBoardTourdays(),
	                    vo.getBoardWritedate(), vo.getBoardViews(), vo.getBoardPoint(), vo.getBoardType(),vo.getBoardRegion(),dayPlans);
	            System.out.println(routeBoard);
	            String fullPath = fileDir + realName;
	            file.transferTo(new File(fullPath));

	            boardService.insertRoute(routeBoard);
	        } else {
	        	System.out.println("파일이 유효하지 않거나 확장자가 없습니다.");
	           
	        }
	    } else {
	    	 System.out.println("파일이 업로드되지 않았습니다.");
	    	 RouteBoard routeBoard = new RouteBoard(vo.getBoardCode(), vo.getUserCode(), vo.getNickname(), null, null, 
	                vo.getBoardTitle(), vo.getBoardContent(), vo.getBoardTheme(), vo.getBoardTourdays(),
                    vo.getBoardWritedate(), vo.getBoardViews(), vo.getBoardPoint(), vo.getBoardType(),vo.getBoardRegion(),dayPlans);
	        boardService.insertRoute(routeBoard);
	    }

	    return "redirect:/board/route";
}
 

 
 
 
 
 
 @PostMapping("/dayPlans.do")
 @ResponseBody
 public ResponseEntity<String> handleDayPlans(@RequestBody Day day, HttpSession session) {
     List<Day> dayPlans = (List<Day>) session.getAttribute("dayPlans");
     if (dayPlans == null) {
         dayPlans = new ArrayList<>();
     }

     boolean found = false;
     for (int i = 0; i < dayPlans.size(); i++) {
         if (dayPlans.get(i).getDay() == day.getDay()) {
             dayPlans.set(i, day);
             found = true;
             break;
         }
     }

     if (!found) {
         dayPlans.add(day);
     }

     session.setAttribute("dayPlans", dayPlans);
     System.out.println("Session dayPlans: " + dayPlans);

     return ResponseEntity.ok("Successfully added or updated a day plan.");
 }

 
 @GetMapping("/route/{boardCode}")
 public String showRouteBoard(@PathVariable String boardCode, Model model, HttpSession session) throws Exception {
	 User user =(User)session.getAttribute("user");
     RouteBoard routeBoard = boardService.selectRoute(boardCode);
     boardService.updateViews(boardCode);
     model.addAttribute("routeBoard", routeBoard);
     
     List<Comment> comments = commentService.getCommentByCode(boardCode);
     model.addAttribute("comments", comments);
     
     int count = commentService.count(boardCode);
     model.addAttribute("count", count);
     return "board/routePost";   
 }

 @PostMapping("/route/{boardCode}")
 public ResponseEntity<Map<String, Object>> routeComment(@PathVariable String boardCode, @RequestBody Comment comment, HttpSession session) {
 	User user = (User) session.getAttribute("user");
     Map<String, Object> response = new HashMap<>();
     
     if (user != null) {
         commentService.register(comment);
         System.out.println(comment);
         response.put("status", "success");
         response.put("message", "Comment posted successfully");
         response.put("redirect", "/project/board/route/"+boardCode);
         return ResponseEntity.ok(response);
     } else {
         response.put("status", "error");
         response.put("message", "User not logged in");
         response.put("redirect", "/project/user/login.do");
         return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
     }
 }
   
   

}
