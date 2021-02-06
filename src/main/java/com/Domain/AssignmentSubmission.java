package com.Domain;

import javax.persistence.*;

@Entity
@Table(name = "assignment_submission")
public class AssignmentSubmission {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String assignmentTitle;
    private String assignmentDescription;
    private String assignmentFileName;

    public AssignmentSubmission() {

    }

    public AssignmentSubmission(String assignmentTitle, String assignmentDescription) {
        this.assignmentTitle = assignmentTitle;
        this.assignmentDescription = assignmentDescription;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAssignmentTitle() {
        return assignmentTitle;
    }

    public void setAssignmentTitle(String assignmentTitle) {
        this.assignmentTitle = assignmentTitle;
    }

    public String getAssignmentDescription() {
        return assignmentDescription;
    }

    public void setAssignmentDescription(String assignmentDescription) {
        this.assignmentDescription = assignmentDescription;
    }

    public String getAssignmentFileName() {
        return assignmentFileName;
    }

    public void setAssignmentFileName(String assignmentFileName) {
        this.assignmentFileName = assignmentFileName;
    }

}
