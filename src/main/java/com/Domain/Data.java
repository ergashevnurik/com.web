package com.Domain;

import javax.persistence.*;

@Entity
@Table(name = "chart_data")
public class Data {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column
    private Integer id;
    @Column
    private String months;
    @Column
    private Long subscribers;

    @Override
    public String toString() {
        return "Data{" +
                "id=" + id +
                ", months='" + months + '\'' +
                ", subscribers=" + subscribers +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMonths() {
        return months;
    }

    public void setMonths(String months) {
        this.months = months;
    }

    public Long getSubscribers() {
        return subscribers;
    }

    public void setSubscribers(Long subscribers) {
        this.subscribers = subscribers;
    }
}
