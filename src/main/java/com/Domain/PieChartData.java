package com.Domain;

import javax.persistence.*;

@Entity
@Table(name = "pie_chart_data")
public class PieChartData {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String name;

    @Column
    private Integer yaxis;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getYaxis() {
        return yaxis;
    }

    public void setYaxis(Integer yaxis) {
        this.yaxis = yaxis;
    }

    @Override
    public String toString() {
        return "PieChartData{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", yAxis=" + yaxis +
                '}';
    }
}
