package com.Controllers;

import com.Domain.Data;
import com.Domain.PieChartData;
import com.Domain.User;
import com.Repos.DataDao;
import com.Repos.PieChartRepo;
import com.Services.UserService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class DashboardController {
    @Autowired
    private DataDao dataDao;

    @Autowired
    private PieChartRepo pieChartRepo;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String getDashboard(Model model) {
        Page<User> data = userService.findAll();
        long allUsers = data.getTotalElements();
        List<User> userList = data.getContent();
        model.addAttribute("allUsers", allUsers);
        return "dashboard";
    }

    @ResponseBody
    @RequestMapping(value = "/line-chart", method = RequestMethod.GET)
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

    @RequestMapping(value = "/pie-chart", method = RequestMethod.GET)
    public ResponseEntity<?> getPieChartDataFromDb() {
        List<PieChartData> data = pieChartRepo.findAll();
        return new ResponseEntity<>(data, HttpStatus.OK);
    }
}

