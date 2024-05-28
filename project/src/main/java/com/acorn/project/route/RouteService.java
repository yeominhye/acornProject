package com.acorn.project.route;

import com.acorn.project.route.RouteDTO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class RouteService {
    private List<RouteDTO> routes = new ArrayList<>();
    private AtomicLong counter = new AtomicLong();

    public RouteDTO saveRoute(RouteDTO route) {
        route.setId(counter.incrementAndGet());
        routes.add(route);
        return route;
    }

    public List<RouteDTO> findAll() {
        return routes;
    }

    public RouteDTO findById(Long id) {
        return routes.stream().filter(route -> route.getId().equals(id)).findFirst().orElse(null);
    }
}
