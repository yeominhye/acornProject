package com.acorn.project.index;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

@Controller
public class IndexController {

    @Autowired
    private IndexService indexService;

    @GetMapping("/index")
    public String main(@RequestParam(value = "year", defaultValue = "") String year,
                       @RequestParam(value = "month", defaultValue = "") String month,
                       @RequestParam(value = "area", defaultValue = "") String area,
                       @RequestParam(value = "numOfRows", defaultValue = "3") String numOfRows,
                       @RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
                       Model model, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();

        Calendar cal = Calendar.getInstance();
        if (year.isEmpty()) {
            year = String.valueOf(cal.get(Calendar.YEAR));
        }

        if (month.equals("") || month.isEmpty()) {
            month = (String) session.getAttribute("selectedMonth");
            if (month == null) {
                month = String.format("%02d", cal.get(Calendar.MONTH) + 1);
            }
        } else {
            session.setAttribute("selectedMonth", month);
        }

        if (area.equals("") || area.isEmpty()) {
            area = (String) session.getAttribute("selectedArea");
            if (area == null) {
                area = "1";
            }
        } else {
            session.setAttribute("selectedArea", area);
        }

        String tourJsonData = indexService.getDataTour(numOfRows, pageNo, area);
        ArrayList<TourDTO1> tourList = new ArrayList<>();
        try {
            tourList = indexService.extractTours(tourJsonData);
        } catch (JSONException e) {
            e.printStackTrace(); // ?òê?äî ?ã§Î•? ?ò§Î•? Ï≤òÎ¶¨ ?ûë?óÖ ?àò?ñâ
        }
        model.addAttribute("tourList", tourList);

        String eventJsonData = indexService.getDataEvent(numOfRows, pageNo, year, month);
        ArrayList<EventDTO1> eventList = new ArrayList<>();
        try {
            eventList = indexService.extractEvents(eventJsonData);
        } catch (JSONException e) {
            e.printStackTrace(); // ?òê?äî ?ã§Î•? ?ò§Î•? Ï≤òÎ¶¨ ?ûë?óÖ ?àò?ñâ
        }
        model.addAttribute("eventList", eventList);

        model.addAttribute("selectedYear", year);
        model.addAttribute("selectedMonth", month);
        model.addAttribute("selectedArea", area);
        return "index";
    }

    @GetMapping(value = "/eventlist", produces = "application/json;charset=utf-8")
    public String eventList(
            @RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
            @RequestParam(value = "year", defaultValue = "") String year,
            @RequestParam(value = "month", defaultValue = "") String month,
            @RequestParam(value = "area", defaultValue = "") String area,
            Model model, HttpServletRequest request) throws IOException {
        
        HttpSession session = request.getSession();
        String numOfRows = "12"; // ?ïú ?éò?ù¥Ïß??óê Î≥¥Ïó¨Ïß? Í∞úÏàò

        // year, month, area Í∞íÏù¥ ?óÜ?ùÑ Í≤ΩÏö∞ ?Ñ∏?Öò?óê?Ñú Í∏∞Î≥∏Í∞? Í∞??†∏?ò§Í∏?
        if (year.isEmpty()) {
            year = (String) session.getAttribute("selectedYear");
        } else {
            session.setAttribute("selectedYear", year);
        }

        if (month.isEmpty()) {
            month = (String) session.getAttribute("selectedMonth");
        } else {
            session.setAttribute("selectedMonth", month);
        }

        if (area.isEmpty()) {
            area = (String) session.getAttribute("selectedArea");
        } else {
            session.setAttribute("selectedArea", area);
        }

        // Í∏∞Î≥∏Í∞? ?ôï?ù∏ Î∞? ?Ñ§?†ï
        if (year == null || year.isEmpty()) {
            year = "2023"; // ?òê?äî ?ã§Î•? Í∏∞Î≥∏Í∞? ?Ñ§?†ï
        }
        if (month == null || month.isEmpty()) {
            month = "01"; // ?òê?äî ?ã§Î•? Í∏∞Î≥∏Í∞? ?Ñ§?†ï
        }

        // ?à´?ûê Î≥??ôò Í∞??ä•?Ñ± ?ôï?ù∏
        try {
            Integer.parseInt(pageNo);
            Integer.parseInt(year);
            Integer.parseInt(month);
        } catch (NumberFormatException e) {
            // ?†Å?†à?ïú ?ò§Î•? Ï≤òÎ¶¨ ?òê?äî Í∏∞Î≥∏Í∞? ?Ñ§?†ï
            pageNo = "1";
            year = "2023";
            month = "01";
        }

        // ?ù¥Î≤§Ìä∏ ?ç∞?ù¥?Ñ∞ Ï°∞Ìöå
        String eventJsonData = indexService.getDataEvent1(numOfRows, pageNo, year, month,area);
        ArrayList<EventDTO1> eventList = new ArrayList<>();
        try {
            eventList = indexService.extractEvents(eventJsonData);
        } catch (JSONException e) {
            e.printStackTrace(); // ?òê?äî ?ã§Î•? ?ò§Î•? Ï≤òÎ¶¨ ?ûë?óÖ ?àò?ñâ
        }
        model.addAttribute("eventList", eventList);

        // ?†ÑÏ≤? ?éò?ù¥Ïß? Í∞úÏàò Í≥ÑÏÇ∞
        int totalEventCount = 100; // ?†ÑÏ≤? ?ù¥Î≤§Ìä∏ Í∞úÏàò (?òà?ãúÎ°? 100?úºÎ°? Í∞??†ï)
        int totalPages = (int) Math.ceil((double) totalEventCount / Integer.parseInt(numOfRows));

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", totalPages);

        return "eventlist";
    }


    @GetMapping(value="/tourlist", produces = "application/json;charset=utf-8")
    public String tourList(@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
                           @RequestParam(value = "area", defaultValue = "") String area,
                           @RequestParam(value = "mapX", defaultValue = "") String mapX,
                           @RequestParam(value = "mapY", defaultValue = "") String mapY,
                           Model model, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        String numOfRows = "12"; // ?ïú ?éò?ù¥Ïß??óê Î≥¥Ïó¨Ïß? Í∞úÏàò

        // area Í∞íÏù¥ ?óÜ?ùÑ Í≤ΩÏö∞ ?Ñ∏?Öò?óê?Ñú Í∏∞Î≥∏Í∞? Í∞??†∏?ò§Í∏?
        if (area.isEmpty()) {
            area = (String) session.getAttribute("selectedArea");
        } else {
            session.setAttribute("selectedArea", area);
        }

        // ?à¨?ñ¥ ?ç∞?ù¥?Ñ∞ Ï°∞Ìöå
        String tourJsonData = indexService.getDataTour(numOfRows, pageNo, area);
        String tourJsonData2 = indexService.getDataTour2(numOfRows, pageNo, area, mapX, mapY);
        ArrayList<TourDTO1> tourList = new ArrayList<>();
        ArrayList<TourDTO_dist> tourList2 = new ArrayList<>();
        try {
            tourList = indexService.extractTours(tourJsonData);
            tourList2 = indexService.extractTours2(tourJsonData2);
        } catch (JSONException e) {
            e.printStackTrace(); // ?òê?äî ?ã§Î•? ?ò§Î•? Ï≤òÎ¶¨ ?ûë?óÖ ?àò?ñâ
        }
        model.addAttribute("tourList", tourList);
        model.addAttribute("tourList2", tourList2);

        // ?†ÑÏ≤? ?éò?ù¥Ïß? Í∞úÏàò Í≥ÑÏÇ∞
        int totalTourCount = 100; // ?†ÑÏ≤? Í¥?Í¥? ?†ïÎ≥? Í∞úÏàò (?òà?ãúÎ°? 100?úºÎ°? Í∞??†ï)
        int totalPages = (int) Math.ceil((double) totalTourCount / Integer.parseInt(numOfRows));

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", totalPages);

        return "tourlist";
    }


    @GetMapping("/index/tourInfo")
    public String getTourInfo(@RequestParam("contentId") String contentId,
                              @RequestParam("contentTypeId") String contentTypeId,
                              Model model) throws IOException {
        String jsonData = indexService.getTourInfo(contentId, contentTypeId);
        ArrayList<TourDTO2> tourInfo = indexService.extractTourInfo(jsonData);
        model.addAttribute("tourInfo", tourInfo);
        return "tourDetail";
    }

    @GetMapping("/index/eventInfo")
    public String getEventInfo(@RequestParam("contentId") String contentId,
                               @RequestParam("contentTypeId") String contentTypeId,
                               Model model) throws IOException {
        String jsonData = indexService.getEventInfo(contentId, contentTypeId);
        String jsonData2 = indexService.getEventInfo3(contentId, contentTypeId);
        ArrayList<EventDTO2> eventInfo = indexService.extractEventInfo(jsonData);
        ArrayList<EventDTO3> eventInfo2 = indexService.extractEventInfo2(jsonData2);
        model.addAttribute("eventInfo", eventInfo);
        model.addAttribute("eventInfo2", eventInfo2);
        return "eventDetail";
        
    }
    
    
    @GetMapping("/tourlist/tourInfo")
    public String getTourInfo2(@RequestParam("contentId") String contentId,
                              @RequestParam("contentTypeId") String contentTypeId,
                              Model model) throws IOException {
        String jsonData = indexService.getTourInfo(contentId, contentTypeId);
        ArrayList<TourDTO2> tourInfo = indexService.extractTourInfo(jsonData);
        model.addAttribute("tourInfo", tourInfo);
        return "tourDetail";
    }

    @GetMapping("/eventlist/eventInfo")
    public String getEventInfo2(@RequestParam("contentId") String contentId,
                               @RequestParam("contentTypeId") String contentTypeId,
                               Model model) throws IOException {
        String jsonData = indexService.getEventInfo(contentId, contentTypeId);
        String jsonData2 = indexService.getEventInfo3(contentId, contentTypeId);
        ArrayList<EventDTO2> eventInfo = indexService.extractEventInfo(jsonData);
        ArrayList<EventDTO3> eventInfo2 = indexService.extractEventInfo2(jsonData2);
        model.addAttribute("eventInfo", eventInfo);
        model.addAttribute("eventInfo2", eventInfo2);
        
        return "eventDetail";
    }
    
}
