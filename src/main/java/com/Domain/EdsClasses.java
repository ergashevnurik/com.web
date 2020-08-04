package com.Domain;

import javax.persistence.*;

@Entity
@Table(name = "edsClasses")
public class EdsClasses {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String title;
    private String bookTitle;
    private String description;
    private Integer extendedDate;
    private Integer dueDate;
    private String submissionMethod;
    private String status;
    private String submissionFormat;

    private String filename;

    public EdsClasses() {

    }

    public EdsClasses(String title, String bookTitle, String description, Integer extendedDate,
                      Integer dueDate, String submissionMethod, String status, String submissionFormat) {
        this.title = title;
        this.bookTitle = bookTitle;
        this.description = description;
        this.extendedDate = extendedDate;
        this.dueDate = dueDate;
        this.submissionMethod = submissionMethod;
        this.status = status;
        this.submissionFormat = submissionFormat;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Integer getExtendedDate() {
        return extendedDate;
    }

    public void setExtendedDate(Integer extendedDate) {
        this.extendedDate = extendedDate;
    }

    public Integer getDueDate() {
        return dueDate;
    }

    public void setDueDate(Integer dueDate) {
        this.dueDate = dueDate;
    }

    public String getSubmissionMethod() {
        return submissionMethod;
    }

    public void setSubmissionMethod(String submissionMethod) {
        this.submissionMethod = submissionMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSubmissionFormat() {
        return submissionFormat;
    }

    public void setSubmissionFormat(String submissionFormat) {
        this.submissionFormat = submissionFormat;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
