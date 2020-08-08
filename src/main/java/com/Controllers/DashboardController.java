package com.Controllers;

import com.Domain.Data;
import com.Repos.DataDao;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    @Autowired
    private DataDao dataDao;

    @GetMapping("/dashboard")
    public String getDashboard() {
        return "dashboard";
    }

    @ResponseBody
    @GetMapping
    public String getDataFromDb() {
        List<Data> dataList = dataDao.findAll();
        JsonArray jsonMonth = new JsonArray();
        JsonArray jsonSubscribes = new JsonArray();
        JsonObject jsonObject = new JsonObject();

        dataList.forEach(data -> {
            jsonMonth.add(data.getMonths());
            jsonSubscribes.add(data.getSubscribers());
        });

        jsonObject.add("months", jsonMonth);
        jsonObject.add("subscribers", jsonSubscribes);

        return jsonObject.toString();

    }

}

