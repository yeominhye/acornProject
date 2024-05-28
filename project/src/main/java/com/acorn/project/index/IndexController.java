package com.acorn.project.index;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {

    @Autowired
    private IndexService indexService;

//    @GetMapping("/index")
//    public String main(@RequestParam(value = "year", defaultValue = "") String year,
//                       @RequestParam(value = "month", defaultValue = "") String month,
//                       @RequestParam(value = "area", defaultValue = "") String area,
//                       @RequestParam(value = "numOfRows", defaultValue = "3") String numOfRows,
//                       @RequestParam(value = "pageNo", defaultValue = "1") String pageNo, 
//                       Model model, HttpServletRequest request) throws IOException {
//
//        HttpSession session = request.getSession();
//        Calendar cal = Calendar.getInstance();
//
//        year = getOrDefault(year, String.valueOf(cal.get(Calendar.YEAR)), session, "selectedYear");
//        month = getOrDefault(month, String.format("%02d", cal.get(Calendar.MONTH) + 1), session, "selectedMonth");
//        area = getOrDefault(area, "1", session, "selectedArea");
//
//        addTourListToModel(numOfRows, pageNo, area, model);
//        addEventListToModel(numOfRows, pageNo, year, month, model);
//
//        model.addAttribute("selectedYear", year);
//        model.addAttribute("selectedMonth", month);
//        model.addAttribute("selectedArea", area);
//
//        return "index";
//    }

//    @GetMapping(value = "/eventlist", produces = "application/json;charset=utf-8")
//    public String eventList(@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
//                            @RequestParam(value = "year", defaultValue = "") String year,
//                            @RequestParam(value = "month", defaultValue = "") String month,
//                            @RequestParam(value = "area", defaultValue = "") String area, 
//                            Model model, HttpServletRequest request) throws IOException {
//
//        HttpSession session = request.getSession();
//        String numOfRows = "12";
//
//        year = getOrDefault(year, "2023", session, "selectedYear");
//        month = getOrDefault(month, "01", session, "selectedMonth");
//        area = getOrDefault(area, "1", session, "selectedArea");
//
//        addEventListToModel(numOfRows, pageNo, year, month, model);
//
//        int totalEventCount = 100;
//        int totalPages = (int) Math.ceil((double) totalEventCount / Integer.parseInt(numOfRows));
//
//        model.addAttribute("currentPage", pageNo);
//        model.addAttribute("totalPages", totalPages);
//
//        return "eventlist";
//    }
//
//    @GetMapping(value = "/tourlist", produces = "application/json;charset=utf-8")
//    public String tourList(@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
//                           @RequestParam(value = "area", defaultValue = "1") String area,
//                           @RequestParam(value = "arrange", defaultValue = "Q") String arrange,
//                           @RequestParam(value = "mapX", defaultValue = "") String mapX,
//                           @RequestParam(value = "mapY", defaultValue = "") String mapY,
//                           Model model, HttpServletRequest request) throws IOException {
//
//        HttpSession session = request.getSession();
//        String numOfRows = "12";
//
//        area = getOrDefault(area, "1", session, "selectedArea");
//        arrange = getOrDefault(arrange, "Q", session, "arrange");
//        mapX = getOrDefault(mapX, "", session, "mapX");
//        mapY = getOrDefault(mapY, "", session, "mapY");
//
//        addTourListToModel(numOfRows, pageNo, area, arrange, mapX, mapY, model);
//
//        int totalTourCount = 100; // 총 관광지 수
//        int totalPages = (int) Math.ceil((double) totalTourCount / Integer.parseInt(numOfRows));
//
//        model.addAttribute("currentPage", pageNo);
//        model.addAttribute("totalPages", totalPages);
//        model.addAttribute("selectedArea", area); // 선택한 지역을 모델에 추가
//
//        return "tourlist";
//    }
//
//
//    @GetMapping(value = "/index/tourInfo", produces = "application/json;charset=utf-8")
//    public String getTourInfo(@RequestParam("contentId") String contentId,
//                              @RequestParam("contentTypeId") String contentTypeId, Model model) throws IOException {
//        addTourInfoToModel(contentId, contentTypeId, model);
//        return "tourDetail";
//    }
//
//    @GetMapping(value = "/tourlist/tourInfo", produces = "application/json;charset=utf-8")
//    public String getTourInfo2(@RequestParam("contentId") String contentId,
//                               @RequestParam("contentTypeId") String contentTypeId, Model model) throws IOException {
//        addTourInfoToModel(contentId, contentTypeId, model);
//        return "tourDetail";
//    }
//
//    @GetMapping("/index/eventInfo")
//    public String getEventInfo(@RequestParam("contentId") String contentId,
//                               @RequestParam("contentTypeId") String contentTypeId, Model model) throws IOException {
//        addEventInfoToModel(contentId, contentTypeId, model);
//        return "eventDetail";
//    }
//
//    @GetMapping("/eventlist/eventInfo")
//    public String getEventInfo2(@RequestParam("contentId") String contentId,
//                                @RequestParam("contentTypeId") String contentTypeId, Model model) throws IOException {
//        addEventInfoToModel(contentId, contentTypeId, model);
//        return "eventDetail";
//    }
//
//    private String getOrDefault(String value, String defaultValue, HttpSession session, String sessionKey) {
//        if (value.isEmpty()) {
//            value = (String) session.getAttribute(sessionKey);
//            if (value == null) {
//                value = defaultValue;
//            }
//        } else {
//            session.setAttribute(sessionKey, value);
//        }
//        return value;
//    }
//
//    private void addTourListToModel(String numOfRows, String pageNo, String area, Model model) throws IOException {
//        String tourJsonData = indexService.getDataTour(numOfRows, pageNo, area);
//        ArrayList<TourDTO1> tourList = new ArrayList<>();
//        try {
//            tourList = indexService.extractTours(tourJsonData);
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//        model.addAttribute("tourList", tourList);
//    }
//
//    private void addTourListToModel(String numOfRows, String pageNo, String area, String arrange, String mapX, String mapY, Model model) throws IOException {
//        String tourJsonData = indexService.getDataTour(numOfRows, pageNo, area);
//        String tourJsonData2 = indexService.getDataTour2(numOfRows, pageNo, arrange, mapX, mapY);
//
//        ArrayList<TourDTO1> tourList = new ArrayList<>();
//        ArrayList<TourDTO_dist> tourList2 = new ArrayList<>();
//
//        try {
//            if (arrange.equals("S")) {
//                if (!tourJsonData2.isEmpty()) { // tourJsonData2가 비어있지 않은 경우에만 처리
//                    tourList2 = indexService.extractTours2(tourJsonData2);
//                    model.addAttribute("tourList", tourList2);
//                }
//            } else {
//                if (!tourJsonData.isEmpty()) { // tourJsonData가 비어있지 않은 경우에만 처리
//                    tourList = indexService.extractTours(tourJsonData);
//                    model.addAttribute("tourList", tourList);
//                }
//            }
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//    }
//
//    private void addEventListToModel(String numOfRows, String pageNo, String year, String month, Model model) throws IOException {
//        String eventJsonData = indexService.getDataEvent(numOfRows, pageNo, year, month);
//        ArrayList<EventDTO1> eventList = new ArrayList<>();
//        try {
//            eventList = indexService.extractEvents(eventJsonData);
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//        model.addAttribute("eventList", eventList);
//    }
//
//    private void addTourInfoToModel(String contentId, String contentTypeId, Model model) throws IOException {
//        String jsonData = indexService.getTourInfo(contentId, contentTypeId);
//        String jsonData2 = indexService.getTourInfo3(contentId, contentTypeId);
//        ArrayList<TourDTO2> tourInfo = new ArrayList<>();
//        ArrayList<TourDTO3> tourInfo2 = new ArrayList<>();
//        try {
//            tourInfo = indexService.extractTourInfo(jsonData);
//            tourInfo2 = indexService.extractTourInfo2(jsonData2);
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//        model.addAttribute("tourInfo", tourInfo);
//        model.addAttribute("tourInfo2", tourInfo2);
//    }
//
//    private void addEventInfoToModel(String contentId, String contentTypeId, Model model) throws IOException {
//        String jsonData = indexService.getEventInfo(contentId, contentTypeId);
//        String jsonData2 = indexService.getEventInfo3(contentId, contentTypeId);
//        ArrayList<EventDTO2> eventInfo = new ArrayList<>();
//        ArrayList<EventDTO3> eventInfo2 = new ArrayList<>();
//        try {
//            eventInfo = indexService.extractEventInfo(jsonData);
//            eventInfo2 = indexService.extractEventInfo2(jsonData2);
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//        model.addAttribute("eventInfo", eventInfo);
//        model.addAttribute("eventInfo2", eventInfo2);
//    }
}
