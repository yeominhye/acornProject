//package com.acorn.project.index;
//
//import org.json.JSONException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Calendar;
//import java.util.Collections;
//import java.util.List;
//
//import com.acorn.project.tour.*;
//import com.acorn.project.IndexService;
//import com.acorn.project.event.*;
//
//@Controller
//public class IndexController {
//
//	@Autowired
//	private IndexService indexService;
//
//	@GetMapping(value = "/", produces = "application/json;charset=utf-8")
//	public String main(@RequestParam(value = "year", defaultValue = "") String year,
//			@RequestParam(value = "month", defaultValue = "") String month,
//			@RequestParam(value = "area", defaultValue = "") String area,
//			@RequestParam(value = "numOfRows", defaultValue = "3") String numOfRows,
//			@RequestParam(value = "pageNo", defaultValue = "1") String pageNo, Model model, HttpServletRequest request)
//			throws IOException {
//
//		HttpSession session = request.getSession();
//		Calendar cal = Calendar.getInstance();
//
//		year = getOrDefault(year, String.valueOf(cal.get(Calendar.YEAR)), session, "selectedYear");
//		month = getOrDefault(month, String.format("%02d", cal.get(Calendar.MONTH) + 1), session, "selectedMonth");
//		area = getOrDefault(area, "1", session, "selectedArea");
//
//		addTourListToModel(numOfRows, pageNo, area, model);
//		addEventListToModel(numOfRows, pageNo, year, month, model);
//
//		model.addAttribute("selectedYear", year);
//		model.addAttribute("selectedMonth", month);
//		model.addAttribute("selectedArea", area);
//
//		return "index";
//	}
//
//	@GetMapping("/ajax/tourlist")
//	@ResponseBody
//	public List<TourDTO1> getTourListAjax(@RequestParam(value = "area", defaultValue = "1") String area,
//			@RequestParam(value = "pageNo", defaultValue = "1") String pageNo) {
//		try {
//			String numOfRows = "3";
//			return indexService.extractTours(indexService.getDataTour(numOfRows, pageNo, area));
//		} catch (IOException | JSONException e) {
//			e.printStackTrace();
//			return Collections.emptyList();
//		}
//	}
//
//	@GetMapping("/ajax/eventlist")
//	@ResponseBody
//	public List<EventDTO1> getEventListAjax(@RequestParam(value = "year", defaultValue = "2024") String year,
//			@RequestParam(value = "month", defaultValue = "01") String month,
//			@RequestParam(value = "pageNo", defaultValue = "1") String pageNo) {
//		try {
//			String numOfRows = "3";
//			return indexService.extractEvents(indexService.getDataEvent(numOfRows, pageNo, year, month));
//		} catch (IOException | JSONException e) {
//			e.printStackTrace();
//			return Collections.emptyList();
//		}
//	}
//
//	@GetMapping(value = "/eventlist", produces = "application/json;charset=utf-8")
//	public String eventList(@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
//			@RequestParam(value = "year", defaultValue = "") String year,
//			@RequestParam(value = "month", defaultValue = "") String month,
//			@RequestParam(value = "area", defaultValue = "") String area, Model model, HttpServletRequest request)
//			throws IOException {
//
//		HttpSession session = request.getSession();
//		String numOfRows = "12";
//
//		year = getOrDefault(year, "2023", session, "selectedYear");
//		month = getOrDefault(month, "01", session, "selectedMonth");
//		area = getOrDefault(area, "1", session, "selectedArea");
//
//		addEventListToModel(numOfRows, pageNo, year, month, model);
//
//		model.addAttribute("currentPage", pageNo);
//		model.addAttribute("totalPages", calculateTotalPages(100, Integer.parseInt(numOfRows)));
//
//		return "eventlist";
//	}
//
//	@GetMapping(value = "/tourlist", produces = "application/json;charset=utf-8")
//	public String tourList(@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
//			@RequestParam(value = "area", defaultValue = "1") String area,
//			@RequestParam(value = "arrange", defaultValue = "Q") String arrange,
//			@RequestParam(value = "mapX", defaultValue = "") String mapX,
//			@RequestParam(value = "mapY", defaultValue = "") String mapY, Model model, HttpServletRequest request)
//			throws IOException {
//
//		HttpSession session = request.getSession();
//		String numOfRows = "12";
//
//		area = getOrDefault(area, "1", session, "selectedArea");
//		arrange = getOrDefault(arrange, "Q", session, "arrange");
//		mapX = getOrDefault(mapX, "", session, "mapX");
//		mapY = getOrDefault(mapY, "", session, "mapY");
//
//		addTourListToModel(numOfRows, pageNo, area, arrange, mapX, mapY, model);
//
//		model.addAttribute("currentPage", pageNo);
//		model.addAttribute("totalPages", calculateTotalPages(100, Integer.parseInt(numOfRows)));
//		model.addAttribute("selectedArea", area);
//
//		return "tourlist";
//	}
//
//	@GetMapping(value = { "/index/tourInfo", "/tourlist/tourInfo" })
//	public String getTourInfo(@RequestParam("contentId") String contentId,
//			@RequestParam("contentTypeId") String contentTypeId, Model model) throws IOException {
//		addTourInfoToModel(contentId, contentTypeId, model);
//		return "tourDetail";
//	}
//
//	@GetMapping(value = { "/index/eventInfo", "/eventlist/eventInfo" })
//	public String getEventInfo(@RequestParam("contentId") String contentId,
//			@RequestParam("contentTypeId") String contentTypeId, Model model) throws IOException {
//		addEventInfoToModel(contentId, contentTypeId, model);
//		return "eventDetail";
//	}
//
//	private String getOrDefault(String value, String defaultValue, HttpSession session, String sessionKey) {
//		if (value.isEmpty()) {
//			value = (String) session.getAttribute(sessionKey);
//			if (value == null) {
//				value = defaultValue;
//			}
//		} else {
//			session.setAttribute(sessionKey, value);
//		}
//		return value;
//	}
//
//	private void addTourListToModel(String numOfRows, String pageNo, String area, Model model) throws IOException {
//		try {
//			model.addAttribute("tourList",
//					indexService.extractTours(indexService.getDataTour(numOfRows, pageNo, area)));
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//	}
//
//	private void addTourListToModel(String numOfRows, String pageNo, String area, String arrange, String mapX,
//			String mapY, Model model) throws IOException {
//		try {
//			if (arrange.equals("S")) {
//				model.addAttribute("tourList",
//						indexService.extractTours2(indexService.getDataTour2(numOfRows, pageNo, arrange, mapX, mapY)));
//			} else {
//				model.addAttribute("tourList",
//						indexService.extractTours(indexService.getDataTour(numOfRows, pageNo, area)));
//			}
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//	}
//
//	private void addEventListToModel(String numOfRows, String pageNo, String year, String month, Model model)
//			throws IOException {
//		try {
//			model.addAttribute("eventList",
//					indexService.extractEvents(indexService.getDataEvent(numOfRows, pageNo, year, month)));
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//	}
//
//	private void addTourInfoToModel(String contentId, String contentTypeId, Model model) throws IOException {
//		try {
//			model.addAttribute("tourInfo",
//					indexService.extractTourInfo(indexService.getTourInfo(contentId, contentTypeId)));
//			model.addAttribute("tourInfo2",
//					indexService.extractTourInfo2(indexService.getTourInfo3(contentId, contentTypeId)));
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//	}
//
//	private void addEventInfoToModel(String contentId, String contentTypeId, Model model) throws IOException {
//		try {
//			model.addAttribute("eventInfo",
//					indexService.extractEventInfo(indexService.getEventInfo(contentId, contentTypeId)));
//			model.addAttribute("eventInfo2",
//					indexService.extractEventInfo2(indexService.getEventInfo3(contentId, contentTypeId)));
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//	}
//
//	private int calculateTotalPages(int totalItems, int itemsPerPage) {
//		return (int) Math.ceil((double) totalItems / itemsPerPage);
//	}
//}
