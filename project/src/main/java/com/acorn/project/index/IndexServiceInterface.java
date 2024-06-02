package com.acorn.project.index;

import com.acorn.project.event.EventDTO1;
import com.acorn.project.event.EventDTO2;
import com.acorn.project.event.EventDTO3;
import com.acorn.project.tour.TourDTO1;
import com.acorn.project.tour.TourDTO2;
import com.acorn.project.tour.TourDTO3;
import com.acorn.project.tour.TourDTO_dist;

import java.io.IOException;
import java.util.List;

public interface IndexServiceInterface {
    List<TourDTO1> getDataTour(String numOfRows, String pageNo, String area) throws IOException;
    List<TourDTO_dist> getDataTour2(String numOfRows, String pageNo, String arrange, String mapX, String mapY) throws IOException;
    List<EventDTO1> getDataEvent(String numOfRows, String pageNo, String year, String month) throws IOException;
    TourDTO2 getTourInfo(String contentId, String contentTypeId) throws IOException;
    EventDTO2 getEventInfo(String contentId, String contentTypeId) throws IOException;
}
