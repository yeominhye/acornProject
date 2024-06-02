package com.acorn.project.tour;

import java.util.List;

public interface TourDAOInterface {
    List<TourDTO1> getAllTours();
    TourDTO1 getTourById(int id);
    void saveTour(TourDTO1 tour);
    void deleteTour(int id);
}
