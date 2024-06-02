package com.acorn.project.tour;

import java.util.List;

public class TourService implements TourServiceInterface {
    private TourDAOInterface tourDAO;

    public TourService(TourDAOInterface tourDAO) {
        this.tourDAO = tourDAO;
    }

    @Override
    public List<TourDTO1> getAllTours() {
        return tourDAO.getAllTours();
    }

    @Override
    public TourDTO1 getTourById(int id) {
        return tourDAO.getTourById(id);
    }

    @Override
    public void saveTour(TourDTO1 tour) {
        tourDAO.saveTour(tour);
    }

    @Override
    public void deleteTour(int id) {
        tourDAO.deleteTour(id);
    }
}
