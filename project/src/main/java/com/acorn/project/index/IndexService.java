package com.acorn.project.index;

import org.springframework.stereotype.Component;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Component
public class IndexService {
	private static final String SERVICE_KEY = "8Y1lUgVaQUxTkl%2BZ9d9MIR8S6HXYTseLCTOPhC8BvvtBN47Izx%2B4oaaS1o6TsXPkjv1ktUfEjhExH3JSmP7nJg%3D%3D";

	private String buildUrl(String baseUrl, String... queryParams) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(baseUrl);
		urlBuilder.append("?").append(URLEncoder.encode("serviceKey", "UTF-8")).append("=").append(SERVICE_KEY);
		for (String param : queryParams) {
			urlBuilder.append("&").append(param);
		}
		return urlBuilder.toString();
	}

	private String sendHttpRequest(String urlStr) throws IOException {
		URL url = new URL(urlStr);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		return sb.toString();
	}
	
	
	// 메인?��?���? ?��?��?���?
	public String getDataEvent(String numOfRows, String pageNo, String year, String month) throws IOException {
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR, Integer.parseInt(year));
	    cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
	    int lastDayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

	    String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/searchFestival1",
	            URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"),
	            URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"),
	            URLEncoder.encode("MobileOS", "UTF-8") + "=ETC", URLEncoder.encode("MobileApp", "UTF-8") + "=EventApp",
	            URLEncoder.encode("_type", "UTF-8") + "=json", URLEncoder.encode("arrange", "UTF-8") + "=Q",
	            URLEncoder.encode("listYN", "UTF-8") + "=Y",
	            URLEncoder.encode("eventStartDate", "UTF-8") + "="
	                    + String.format("%s%02d01", year, Integer.parseInt(month)),
	            URLEncoder.encode("eventEndDate", "UTF-8") + "="
	                    + String.format("%s%02d%02d", year, Integer.parseInt(month), lastDayOfMonth));
	                    
	    return sendHttpRequest(url);
	}
	
	// ?��?��?��?���? ?��?��?���?
	public String getDataEvent1(String numOfRows, String pageNo, String year, String month,String area) throws IOException {
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR, Integer.parseInt(year));
	    cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
	    int lastDayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

	    String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/searchFestival1",
	            URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"),
	            URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"),
	            URLEncoder.encode("MobileOS", "UTF-8") + "=ETC", URLEncoder.encode("MobileApp", "UTF-8") + "=EventApp",
	            URLEncoder.encode("_type", "UTF-8") + "=json", URLEncoder.encode("arrange", "UTF-8") + "=Q",
	            URLEncoder.encode("listYN", "UTF-8") + "=Y",
	            URLEncoder.encode("eventStartDate", "UTF-8") + "="
	                    + String.format("%s%02d01", year, Integer.parseInt(month)),
	            URLEncoder.encode("eventEndDate", "UTF-8") + "="
	                    + String.format("%s%02d%02d", year, Integer.parseInt(month), lastDayOfMonth),
	    		URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(area, "UTF-8"));

	    return sendHttpRequest(url);
	}
	
	// ?��?��?���? 리스?��
	public ArrayList<EventDTO1> extractEvents(String jsonData) {
	    try {
	        JSONObject response = new JSONObject(jsonData).optJSONObject("response");
	        if (response != null) {
	            JSONObject body = response.optJSONObject("body");
	            if (body != null) {
	                JSONObject items = body.optJSONObject("items");
	                if (items != null) {
	                    JSONArray eventArr = items.optJSONArray("item");
	                    if (eventArr != null) {
	                        ArrayList<EventDTO1> eventList = new ArrayList<>();
	                        for (int i = 0; i < eventArr.length(); i++) {
	                            JSONObject item = eventArr.getJSONObject(i);
	                            EventDTO1 event = new EventDTO1(item.getString("title"), item.getString("firstimage"),
	                                    item.getString("addr1"), item.getString("addr2"), item.getString("eventstartdate"),
	                                    item.getString("eventenddate"), item.getString("contentid"), item.getString("contenttypeid"));
	                            eventList.add(event);
	                        }
	                        System.out.println(eventList);
	                        return eventList;
	                    }
	                }
	            }
	        }
	    } catch (JSONException e) {
	        e.printStackTrace(); 
	    }
	    return new ArrayList<>(); 
	}

	// 메인?��?���? ?��?��?��?��?���?
	public String getEventInfo(String contentId, String contentTypeId) throws IOException {
	    if (contentId == null || contentTypeId == null || contentId.isEmpty() || contentTypeId.isEmpty()) {
	        return ""; // ?��?�� ?���? 처리
	    }

	    String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/detailIntro1",
	            URLEncoder.encode("numOfRows", "UTF-8") + "=12", URLEncoder.encode("MobileOS", "UTF-8") + "=ETC",
	            URLEncoder.encode("MobileApp", "UTF-8") + "=EventApp2", URLEncoder.encode("_type", "UTF-8") + "=json",
	            URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode(contentId, "UTF-8"),
	            URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8"));

	    return sendHttpRequest(url);
	}
	
	// ?��?��?��?���? ?��?��?��?��?���?
	public String getEventInfo2(String contentId, String contentTypeId) throws IOException {
	    if (contentId == null || contentTypeId == null || contentId.isEmpty() || contentTypeId.isEmpty()) {
	        return "";
	    }

	    String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/detailIntro1",
	            URLEncoder.encode("numOfRows", "UTF-8") + "=12", URLEncoder.encode("MobileOS", "UTF-8") + "=ETC",
	            URLEncoder.encode("MobileApp", "UTF-8") + "=EventApp2", URLEncoder.encode("_type", "UTF-8") + "=json",
	            URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode(contentId, "UTF-8"),
	            URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8"));

	    return sendHttpRequest(url);
	}
	
	// ?��?��?��?��?���? 리스?��
	public ArrayList<EventDTO2> extractEventInfo(String jsonData) {
	    try {
	        JSONObject response = new JSONObject(jsonData).optJSONObject("response");
	        if (response != null) {
	            JSONObject body = response.optJSONObject("body");
	            if (body != null) {
	                JSONObject items = body.optJSONObject("items");
	                if (items != null) {
	                    JSONArray eventArr = items.optJSONArray("item");
	                    if (eventArr != null) {
	                        ArrayList<EventDTO2> edetailList = new ArrayList<>();
	                        for (int i = 0; i < eventArr.length(); i++) {
	                            JSONObject item = eventArr.getJSONObject(i);
	                            EventDTO2 edetail = new EventDTO2(item.getString("eventstartdate"), item.getString("eventenddate"),
	                                    item.getString("eventhomepage"), item.getString("eventplace"), item.getString("sponsor1"),
	                                    item.getString("sponsor2"), item.getString("sponsor2tel"), item.getString("subevent"),
	                                    item.getString("usetimefestival"));
	                            
	                            edetailList.add(edetail);
	                        }
	                        return edetailList;
	                    }
	                }
	            }
	        }
	    } catch (JSONException e) {
	        e.printStackTrace(); 
	    }
	    return new ArrayList<>(); 
	}
	
	// ?��?��?��?��?���?2 (?���?, ?��?��, �?)
	public String getEventInfo3(String contentId, String contentTypeId) throws IOException {
	    if (contentId == null || contentTypeId == null || contentId.isEmpty() || contentTypeId.isEmpty()) {
	        return "";
	    }

	    String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/detailCommon1",
	            URLEncoder.encode("MobileOS", "UTF-8") + "=ETC", URLEncoder.encode("MobileApp", "UTF-8") + "=EventApp3",
	            URLEncoder.encode("_type", "UTF-8") + "=json",
	            URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode(contentId, "UTF-8"),
	            URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8"),
	            URLEncoder.encode("firstImageYN", "UTF-8") + "=Y", URLEncoder.encode("overviewYN", "UTF-8") + "=Y",
	    		URLEncoder.encode("mapinfoYN", "UTF-8") + "=Y", URLEncoder.encode("defaultYN", "UTF-8") + "=Y",
	    		URLEncoder.encode("addrinfoYN", "UTF-8") + "=Y");
	    return sendHttpRequest(url);
	}
	
	// ?��?��?��?��?���? 리스?��2
	public ArrayList<EventDTO3> extractEventInfo2(String jsonData2) {
	    try {
	        JSONObject response = new JSONObject(jsonData2).optJSONObject("response");
	        if (response != null) {
	            JSONObject body = response.optJSONObject("body");
	            if (body != null) {
	                JSONObject items = body.optJSONObject("items");
	                if (items != null) {
	                    JSONArray eventArr = items.optJSONArray("item");
	                    if (eventArr != null) {
	                        ArrayList<EventDTO3> edetailList = new ArrayList<>();
	                        for (int i = 0; i < eventArr.length(); i++) {
	                            JSONObject item = eventArr.getJSONObject(i);
	                            EventDTO3 edetail = new EventDTO3(item.getString("firstimage"), item.getString("overview"),
	                                    item.getString("mlevel"), item.getString("mapx"), item.getString("mapy"), item.getString("addr1"),
	                                    item.getString("title"));
	                            
	                            edetailList.add(edetail);
	                        }
	                        return edetailList;
	                    }
	                }
	            }
	        }
	    } catch (JSONException e) {
	        e.printStackTrace(); 
	    }
	    return new ArrayList<>(); 
	}
	
	
	
	
	
	// 메인?��?���? �?광정�?
	public String getDataTour(String numOfRows, String pageNo, String area) throws IOException {
	    String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/areaBasedList1",
	            URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"),
	            URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"),
	            URLEncoder.encode("MobileOS", "UTF-8") + "=ETC", URLEncoder.encode("MobileApp", "UTF-8") + "=TourApp",
	            URLEncoder.encode("_type", "UTF-8") + "=json", URLEncoder.encode("arrange", "UTF-8") + "=Q",
	            URLEncoder.encode("listYN", "UTF-8") + "=Y", URLEncoder.encode("contentTypeId", "UTF-8") + "=12",
	            URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(area, "UTF-8"));

	    return sendHttpRequest(url);
	}

	// �?광정�? 리스?��1
	public ArrayList<TourDTO1> extractTours(String jsonData) {
	    try {
	        JSONObject response = new JSONObject(jsonData).optJSONObject("response");
	        if (response != null) {
	            JSONObject body = response.optJSONObject("body");
	            if (body != null) {
	                JSONObject items = body.optJSONObject("items");
	                if (items != null) {
	                    JSONArray tourArr = items.optJSONArray("item");
	                    if (tourArr != null) {
	                        ArrayList<TourDTO1> tourList = new ArrayList<>();
	                        for (int i = 0; i < tourArr.length(); i++) {
	                            JSONObject item = tourArr.getJSONObject(i);
	                            TourDTO1 tour = new TourDTO1(item.optString("title"), item.optString("firstimage"),
	                                    item.optString("addr1"), item.optString("addr2"), item.optString("contentid"),
	                                    item.optString("contenttypeid"));
	                            tourList.add(tour);
	                        }
	                        System.out.println(tourList);
	                        return tourList;
	                    }
	                }
	            }
	        }
	    } catch (JSONException e) {
	        e.printStackTrace(); 
	    }
	    return new ArrayList<>(); 
	}
	
	// �?광페?���? �?광정�?(거리?��)
		public String getDataTour2(String numOfRows, String pageNo, String arrange, String mapX, String mapY) throws IOException {
		    String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/locationBasedList1",
		            URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"),
		            URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"),
		            URLEncoder.encode("MobileOS", "UTF-8") + "=ETC", URLEncoder.encode("MobileApp", "UTF-8") + "=TourApp1",
		            URLEncoder.encode("_type", "UTF-8") + "=json", URLEncoder.encode("contentTypeId", "UTF-8") + "=12" ,
		            URLEncoder.encode("arrange", "UTF-8") + "=" + URLEncoder.encode(arrange, "UTF-8"),
		    		URLEncoder.encode("mapX", "UTF-8") + "=" + URLEncoder.encode(mapX, "UTF-8"),
		    		URLEncoder.encode("mapY", "UTF-8") + "=" + URLEncoder.encode(mapY, "UTF-8"),
		    		URLEncoder.encode("radius", "UTF-8") + "=200000");

		    return sendHttpRequest(url);
		}

		// �?광정�? 리스?��2
		public ArrayList<TourDTO_dist> extractTours2(String jsonData) {
		    try {
		        JSONObject response = new JSONObject(jsonData).optJSONObject("response");
		        if (response != null) {
		            JSONObject body = response.optJSONObject("body");
		            if (body != null) {
		                JSONObject items = body.optJSONObject("items");
		                if (items != null) {
		                    JSONArray tourArr = items.optJSONArray("item");
		                    if (tourArr != null) {
		                        ArrayList<TourDTO_dist> tourList = new ArrayList<>();
		                        for (int i = 0; i < tourArr.length(); i++) {
		                            JSONObject item = tourArr.getJSONObject(i);
		                            TourDTO_dist tour = new TourDTO_dist(item.optString("title"), item.optString("firstimage"),
		                                    item.optString("addr1"), item.optString("addr2"), item.optDouble("dist"),
		                                    item.optString("contentid"), item.optString("contenttypeid"), item.optString("mapx"),
		                                    item.optString("mapy"), item.optString("mlevel"));
		                            tourList.add(tour);
		                        }
		                        System.out.println(tourList);
		                        return tourList;
		                    }
		                }
		            }
		        }
		    } catch (JSONException e) {
		        e.printStackTrace(); 
		    }
		    return new ArrayList<>(); 
		}

	// 메인?��?���? �?광상?��?���?
	public String getTourInfo(String contentId, String contentTypeId) throws IOException {
	    if (contentId == null || contentTypeId == null || contentId.isEmpty() || contentTypeId.isEmpty()) {
			return ""; 
		}

		String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/detailCommon1",
				URLEncoder.encode("MobileOS", "UTF-8") + "=ETC", URLEncoder.encode("_type", "UTF-8") + "=json",
				URLEncoder.encode("MobileApp", "UTF-8") + "=TourApp2",
				URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode(contentId, "UTF-8"),
				URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8"),
				URLEncoder.encode("defaultYN", "UTF-8") + "=Y", URLEncoder.encode("addrinfoYN", "UTF-8") + "=Y",
				URLEncoder.encode("firstImageYN", "UTF-8") + "=Y", URLEncoder.encode("overviewYN", "UTF-8") + "=Y");

		return sendHttpRequest(url);
	}
	
	// �?광페?���? �?광상?��?���?
	public String getTourInfo2(String contentId, String contentTypeId) throws IOException {
	    if (contentId == null || contentTypeId == null || contentId.isEmpty() || contentTypeId.isEmpty()) {
			return "";
		}

		String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/detailCommon1",
				URLEncoder.encode("MobileOS", "UTF-8") + "=ETC", URLEncoder.encode("_type", "UTF-8") + "=json",
				URLEncoder.encode("MobileApp", "UTF-8") + "=TourApp3",
				URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode(contentId, "UTF-8"),
				URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8"),
				URLEncoder.encode("defaultYN", "UTF-8") + "=Y", URLEncoder.encode("addrinfoYN", "UTF-8") + "=Y",
				URLEncoder.encode("firstImageYN", "UTF-8") + "=Y", URLEncoder.encode("overviewYN", "UTF-8") + "=Y");

		return sendHttpRequest(url);
	}

	// �?광상?��?���? 리스?��
	public ArrayList<TourDTO2> extractTourInfo(String jsonData) {
	    try {
	        JSONObject response = new JSONObject(jsonData).optJSONObject("response");
	        if (response != null) {
	            JSONObject body = response.optJSONObject("body");
	            if (body != null) {
	                JSONObject items = body.optJSONObject("items");
	                if (items != null) {
	                    JSONArray tourArr = items.optJSONArray("item");
	                    if (tourArr != null) {
	                        ArrayList<TourDTO2> tdetailList = new ArrayList<>();
	                        for (int i = 0; i < tourArr.length(); i++) {
	                            JSONObject item = tourArr.getJSONObject(i);
	                            TourDTO2 tdetail = new TourDTO2(item.optString("title"), item.optString("tel"),
	                                    item.optString("firstimage"), item.optString("homepage"), item.optString("addr1"),
	                                    item.optString("overview"));
	                            tdetailList.add(tdetail);
	                        }
	                        return tdetailList;
	                    }
	                }
	            }
	        }
	    } catch (JSONException e) {
	        e.printStackTrace(); 
	    }
	    return new ArrayList<>();
	}
	
	// �?광상?��?���?2
		public String getTourInfo3(String contentId, String contentTypeId) throws IOException {
		    if (contentId == null || contentTypeId == null || contentId.isEmpty() || contentTypeId.isEmpty()) {
		        return "";
		    }

		    String url = buildUrl("http://apis.data.go.kr/B551011/KorService1/detailIntro1",
		            URLEncoder.encode("MobileOS", "UTF-8") + "=ETC", URLEncoder.encode("MobileApp", "UTF-8") + "TourApp4",
		            URLEncoder.encode("_type", "UTF-8") + "=json",
		            URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode(contentId, "UTF-8"),
		            URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8"),
		            URLEncoder.encode("firstImageYN", "UTF-8") + "=Y", URLEncoder.encode("overviewYN", "UTF-8") + "=Y",
		    		URLEncoder.encode("mapinfoYN", "UTF-8") + "=Y", URLEncoder.encode("defaultYN", "UTF-8") + "=Y",
		    		URLEncoder.encode("addrinfoYN", "UTF-8") + "=Y");
		    
		    return sendHttpRequest(url);
		}
		
		// �?광상?��?���? 리스?��2
		public ArrayList<TourDTO3> extractTourInfo2(String jsonData) {
		    try {
		        JSONObject response = new JSONObject(jsonData).optJSONObject("response");
		        if (response != null) {
		            JSONObject body = response.optJSONObject("body");
		            if (body != null) {
		                JSONObject items = body.optJSONObject("items");
		                if (items != null) {
		                    JSONArray tourArr = items.optJSONArray("item");
		                    if (tourArr != null) {
		                        ArrayList<TourDTO3> tdetailList = new ArrayList<>();
		                        for (int i = 0; i < tourArr.length(); i++) {
		                            JSONObject item = tourArr.getJSONObject(i);
		                            TourDTO3 tdetail = new TourDTO3(item.optString("expguide"), item.optString("infocenter"),
		                                    item.optString("restdate"), item.optString("parking"));
		                            tdetailList.add(tdetail);
		                        }
		                        return tdetailList;
		                    }
		                }
		            }
		        }
		    } catch (JSONException e) {
		        e.printStackTrace(); 
		    }
		    return new ArrayList<>();
		}
}
