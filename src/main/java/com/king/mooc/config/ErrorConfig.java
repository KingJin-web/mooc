package com.king.mooc.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

/**
 * @author: King
 * @project: mooc
 * @date: 2022年06月25日 23:17
 * @description:
 */
@Configuration
public class ErrorConfig implements ErrorPageRegistrar {

    @Override
    public void registerErrorPages(ErrorPageRegistry registry) {
        ErrorPage errorPage_404 = new ErrorPage(HttpStatus.NOT_FOUND,"/error/404");
        ErrorPage errorPage_500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR,"/error/500");

        registry.addErrorPages(errorPage_404, errorPage_500);
    }
}
