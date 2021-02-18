package com.jspexample.demo.dao;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.security.Timestamp;
import java.util.Date;
import java.util.HashMap;

@Entity
@Table(name = "social_facebook_config")
public class SocialFacebookConfiguration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int                     id;
    private int                     cmId;
    @Column(unique=true)
    private String                  pageId;
    private String                  pageName;
    private String                  accessToken;
    @CreationTimestamp
    @Temporal(TemporalType.DATE)
    private Date                    createTime;
    private Timestamp               accessTokenExipreDate;
    private boolean                 enabled;
    private String                  queueKey;
    private int                     slaTime;
    private int                     folderId;
    private int                     leadAssignedToId;
    private int                     leadCreatorId;
    private HashMap<String, String> fbFeildNameToDbName;
    private int                     messageFolderId;
    private boolean                 isMerge         = false;
    private int                     mergingTime     = 0;
    private char                    mergeTaskStatus = '-';
    private char                    customerType    = '-';
    private String                  mergeGroup;
    private boolean                 sourceRestricted;
    private int                     restrictedFolderId;
    private String                  subscriptionType;
    public static final String      FEILD_KEY       = "@@@@";
    public static final String      DELIMETER_KEY   = "####";
    public static final char        REGISTERED      = 'R';
    public static final char        UN_REGISTERED   = 'U';

    public String getPageId() {
        return pageId;
    }

    public void setPageId(String pageId) {
        this.pageId = pageId;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    @Override
    public String toString() {
        return "FacebookConfig{" +
                "id=" + id +
                ", cmId=" + cmId +
                ", pageId='" + pageId + '\'' +
                ", pageName='" + pageName + '\'' +
                ", accessToken='" + accessToken + '\'' +
                ", createTime=" + createTime +
                ", accessTokenExipreDate=" + accessTokenExipreDate +
                ", enabled=" + enabled +
                ", queueKey='" + queueKey + '\'' +
                ", slaTime=" + slaTime +
                ", folderId=" + folderId +
                ", leadAssignedToId=" + leadAssignedToId +
                ", leadCreatorId=" + leadCreatorId +
                ", fbFeildNameToDbName=" + fbFeildNameToDbName +
                ", messageFolderId=" + messageFolderId +
                ", isMerge=" + isMerge +
                ", mergingTime=" + mergingTime +
                ", mergeTaskStatus=" + mergeTaskStatus +
                ", customerType=" + customerType +
                ", mergeGroup='" + mergeGroup + '\'' +
                ", sourceRestricted=" + sourceRestricted +
                ", restrictedFolderId=" + restrictedFolderId +
                ", subscriptionType='" + subscriptionType + '\'' +
                '}';
    }

    public SocialFacebookConfiguration() {
    }

}
