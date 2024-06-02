package com.acorn.project.event;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class EventService implements EventServiceInterface {
    @Override
    public List<EventDTO1> getEventList(String numOfRows, String pageNo, String year, String month) throws IOException {
        // Implement logic to fetch event list data
    }

    @Override
    public EventDTO2 getEventInfo(String contentId, String contentTypeId) throws IOException {
        // Implement logic to fetch detailed event info
    }
}
