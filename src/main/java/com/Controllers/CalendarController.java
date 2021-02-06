package com.Controllers;

import com.Domain.Event;
import com.Domain.Resource;
import com.Repos.EventRepo;
import com.Repos.ResourceRepo;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.time.LocalDateTime;

@Controller
public class CalendarController {

    @Autowired
    private EventRepo eventRepo;
    
    @Autowired
    private ResourceRepo resourceRepo;
    
    @RequestMapping("/api")
    @ResponseBody
    public String getInitialView() {
        return "calendar";
    }
    
    @RequestMapping("/api/resources")
    public Iterable<Resource> getAllData() {
        return resourceRepo.findAll();
    } 
    
    @GetMapping("/api/events")
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    public Iterable<Event> getAllDataFromEvents(@RequestParam("start") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime start, @RequestParam("end") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime end) {
        System.out.println(start);
        System.out.println(end);
        return eventRepo.findBetween(start, end);
    }
    
    @PostMapping("/api/events/create")
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    @Transactional
    public Event createEvent(EventCreateParams params) {
        Resource resource = null;
        
        if (params.resource != null) {

        }
        Event event = new Event();
        event.setStart(params.start);
        event.setEnd(params.end);
        event.setText(params.text);
        event.setResource(resource);
        
        eventRepo.save(event);
        
        return event;
    }
    
    public static class EventCreateParams {
        public LocalDateTime start;
        public LocalDateTime end;
        public String text;
        public Long resource;
    }
    
    public static class EventMoveParams {
        public Long id;
        public LocalDateTime start;
        public LocalDateTime end;
        public Long resource;
    }
    
    public static class SetColorParams {
        public Long id;
        public String color;
    }
    
}
