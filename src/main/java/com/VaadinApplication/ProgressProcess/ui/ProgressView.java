package com.VaadinApplication.ProgressProcess.ui;

import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;

public class ProgressView extends VerticalLayout {

    private Div div;

    public ProgressView() {
        setClassName("progress-view");
        setSizeFull();

        add(init());
    }

    public Component init() {
        div = new Div();
        System.out.println("================= Hello It is Progress View =================");
        return div;
    }
}
