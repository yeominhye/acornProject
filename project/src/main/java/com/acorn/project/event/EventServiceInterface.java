package com.acorn.project.event;

import java.io.IOException;
import java.util.List;

public interface EventServiceInterface {
    List<EventDTO1> getEventList(String numOfRows, String pageNo, String year, String month) throws IOException;
    EventDTO2 getEventInfo(String contentId, String contentTypeId) throws IOException;
}
