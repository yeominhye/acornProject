package com.acorn.project.route;

import com.acorn.project.route.RouteDTO;
import com.acorn.project.route.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

@Controller
@RequestMapping("/routes")
public class RouteController {
    @Autowired
    private RouteService routeService;

    private static String UPLOADED_FOLDER = "/path/to/uploaded/files/"; // ������ ������ ��� ����

    // ��Ʈ ���� ��
    @GetMapping("/new")
    public String createRouteForm(Model model) {
        RouteDTO routeDTO = new RouteDTO();
        routeDTO.setDayPlans(new ArrayList<>()); // �� ����Ʈ�� �ʱ�ȭ
        routeDTO.getDayPlans().add(new DayPlanDTO()); // �⺻���� ���� �߰�

        // ���⼭ �� �������� ��Ŀ ������ ������ �� �ֽ��ϴ�.
        // routeDTO.getDayPlans().get(0).setLatitude(latitude);
        // routeDTO.getDayPlans().get(0).setLongitude(longitude);

        model.addAttribute("route", routeDTO);
        return "route/createRoute"; // JSP ���� ��ο��� ù ��° �����ø� ����
    }

    // ��Ʈ ����
    @PostMapping
    public String saveRoute(@ModelAttribute RouteDTO route, @RequestParam("coverImageFile") MultipartFile coverImageFile) {
        if (!coverImageFile.isEmpty()) {
            try {
                byte[] bytes = coverImageFile.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + coverImageFile.getOriginalFilename());
                Files.write(path, bytes);

                route.setCoverImage(path.toString()); // ���� ��θ� DTO�� ����
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        routeService.saveRoute(route);
        return "redirect:/routes"; // ��� �������� �����̷�Ʈ
    }

    // ��Ʈ ��� ��ȸ
    @GetMapping
    public String listRoutes(Model model) {
        model.addAttribute("routes", routeService.findAll());
        return "route/routes"; // JSP ���� ��ο��� ù ��° �����ø� ����
    }

    // Ư�� ��Ʈ ��ȸ
    @GetMapping("/{id}")
    public String viewRoute(@PathVariable Long id, Model model) {
        model.addAttribute("route", routeService.findById(id));
        return "route/viewRoute"; // JSP ���� ��ο��� ù ��° �����ø� ����
    }

    // īī������API �ʱ�ȭ �� ���� ������ �̵�
    @PostMapping("/next-day")
    public String moveToNextDay(HttpServletRequest request, Model model) {
        // ���⼭ īī������API �ʱ�ȭ ������ �߰�
        // ���� ���, ���ǿ� ����� �����͸� �ʱ�ȭ�ϰų� ���ο� ��Ʈ ��ü�� �����Ͽ� ���� ������ �̵�
        RouteDTO routeDTO = new RouteDTO();
        routeDTO.setDayPlans(new ArrayList<>()); // �� ����Ʈ�� �ʱ�ȭ
        routeDTO.getDayPlans().add(new DayPlanDTO()); // ���� ���� �߰�

        // ���⼭ �� �������� ��Ŀ ������ ������ �� �ֽ��ϴ�.
        // routeDTO.getDayPlans().get(1).setLatitude(latitude);
        // routeDTO.getDayPlans().get(1).setLongitude(longitude);

        model.addAttribute("route", routeDTO);
        return "route/createRoute"; // JSP ���� ��ο��� ù ��° �����ø� ����
    }
}
