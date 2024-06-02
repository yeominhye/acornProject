package com.acorn.project.tour;

import java.util.List;
import java.util.ArrayList;

public class TourDAO implements TourDAOInterface {
    private List<TourDTO1> tours = new ArrayList<>();

    @Override
    public List<TourDTO1> getAllTours() {
        return tours;
    }

    @Override
    public TourDTO1 getTourById(int id) {
        return tours.stream().filter(t -> t.getContentid().equals(id)).findFirst().orElse(null);
    }

    @Override
    public void saveTour(TourDTO1 tour) {
        tours.add(tour);
    }

    @Override
    public void deleteTour(int id) {
        tours.removeIf(t -> t.getContentid().equals(id));
    }
}
