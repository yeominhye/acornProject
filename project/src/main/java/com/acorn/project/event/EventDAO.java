package com.acorn.project.event;

import java.util.List;
import java.util.ArrayList;

public class EventDAO implements EventDAOInterface {
    private List<EventDTO1> events = new ArrayList<>();

    @Override
    public List<EventDTO1> getAllEvents() {
        return events;
    }

    @Override
    public EventDTO1 getEventById(int id) {
        return events.stream().filter(e -> e.getContentid().equals(id)).findFirst().orElse(null);
    }

    @Override
    public void saveEvent(EventDTO1 event) {
        events.add(event);
    }

    @Override
    public void deleteEvent(int id) {
        events.removeIf(e -> e.getContentid().equals(id));
    }
}
