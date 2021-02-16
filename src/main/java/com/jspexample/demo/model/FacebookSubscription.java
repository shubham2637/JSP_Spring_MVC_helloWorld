package com.jspexample.demo.controller.model;

public class FacebookSubscription {
   private Boolean messages;
    private Boolean postComments;
    private Boolean pageMentions;

    public Boolean getMessages() {
        return messages;
    }

    public void setMessages(Boolean messages) {
        this.messages = messages;
    }

    public Boolean getPostComments() {
        return postComments;
    }

    public void setPostComments(Boolean postComments) {
        this.postComments = postComments;
    }

    public Boolean getPageMentions() {
        return pageMentions;
    }

    public void setPageMentions(Boolean pageMentions) {
        this.pageMentions = pageMentions;
    }

    public FacebookSubscription(Boolean messages, Boolean postComments, Boolean pageMentions) {
        this.messages = messages;
        this.postComments = postComments;
        this.pageMentions = pageMentions;
    }

    public FacebookSubscription() {
    }
}
