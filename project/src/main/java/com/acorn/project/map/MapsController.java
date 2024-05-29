package com.acorn.project.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/maps")
public class MapsController {

    @Autowired
    private MapsServiceI mapsService;

    @RequestMapping("/showMap")
    public String showMap(Model model) throws Exception {
        String boardCode = "example"; //세션으로 이 값 넘겨받아서 이 보드코드에 대한 거 보여주면 됨
        Maps maps = mapsService.selectByBoard(boardCode);
        model.addAttribute("maps", maps);

        return "maps/showMap";
    }
    
    @RequestMapping("/createForm")
    public String showCreateForm(Model model) {
        model.addAttribute("maps", new Maps());
        return "maps/createForm";
    }
    
    @PostMapping("/create")
    public String createMap(@ModelAttribute("maps") Maps maps, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // 에러 처리 로직
            return "/maps/createForm";
        }

        try {
            // MapsService를 통해 저장 로직 수행
            mapsService.insertMaps(maps);
        } catch (Exception e) {
            e.printStackTrace();
            // 에러 처리 로직
            return "/maps/createForm";
        }

        // 저장 후 지도 페이지로 리다이렉트, boardCode를 경로 변수로 전달
        return "redirect:/maps/showMap/" + maps.getBoardCode();
    }

    
    
    @GetMapping("/showMap/{boardCode}")
    public String showMapDetail(@PathVariable String boardCode, Model model) {
        try {
            Maps maps = mapsService.selectByBoard(boardCode);
            model.addAttribute("maps", maps);
        } catch (Exception e) {
            e.printStackTrace();
            return "errorPage";
        }

        return "maps/showMap";
    }
    
    
}
