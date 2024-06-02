package com.acorn.project.event;

import java.util.List;

public class EventService implements EventServiceInterface {
    private EventDAOInterface eventDAO;

    public EventService(EventDAOInterface eventDAO) {
        this.eventDAO = eventDAO;
    }

    @Override
    public List<EventDTO1> getAllEvents() {
        return eventDAO.getAllEvents();
    }

    @Override
    public EventDTO1 getEventById(int id) {
        return eventDAO.getEventById(id);
    }

    @Override
    public void saveEvent(EventDTO1 event) {
        eventDAO.saveEvent(event);
    }

    @Override
    public void deleteEvent(int id) {
        eventDAO.deleteEvent(id);
    }
}
