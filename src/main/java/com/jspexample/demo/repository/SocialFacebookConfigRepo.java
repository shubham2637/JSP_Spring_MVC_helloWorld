package com.jspexample.demo.repository;

import com.jspexample.demo.dao.SocialFacebookConfiguration;
import org.springframework.data.repository.CrudRepository;

public interface SocialFacebookConfigRepo extends CrudRepository<SocialFacebookConfiguration,Integer> {
    public Object findByPageId(String pageId);
}
