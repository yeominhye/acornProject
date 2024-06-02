package com.acorn.project.event;

import java.util.List;

public interface EventServiceInterface {
    List<EventDTO1> getAllEvents();
    EventDTO1 getEventById(int id);
    void saveEvent(EventDTO1 event);
    void deleteEvent(int id);
}
