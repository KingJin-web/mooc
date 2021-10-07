package com.king.mooc.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.king.mooc.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.*;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-07 12:59
 */
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

//
    private static final String KEY = "liuyanzhao.com";

    @Autowired
    private UserServiceImpl userService;//实现了UserDetailsService类

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();// 使用 BCrypt 加密
    }

    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    //静态资源配置
    @Override
    public void configure(WebSecurity web) throws Exception {
        //swagger2所需要用到的静态资源，允许访问
        web.ignoring().antMatchers("/swagger/**")
                .antMatchers("/swagger-ui.html")
                .antMatchers("/webjars/**")
                .antMatchers("/v2/**")
                .antMatchers("/v2/api-docs-ext/**")
                .antMatchers("/swagger-resources/**")
                .antMatchers("/doc.html");


    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {


        // 表单认证
        http.formLogin()
                .loginProcessingUrl("/login") //当发现/login 时认为是登录，需 要执行 UserDetailsServiceImpl
                .successForwardUrl("/welcome") //登录成功后，跳转到指定请求（此处是 post 请求）
                .failureForwardUrl("/loginFail")//登录失败
                .loginPage("/login.html");

        // url 拦截
        http.authorizeRequests()
                .antMatchers("/login.html").permitAll() //login.html 不需要被认证
                .antMatchers("/loginfail.html").permitAll() //loginfail.html 不需要被认证
                .antMatchers("/lib/**", "/layui/**", "/images/**", "/index.html","/**").permitAll()
                .antMatchers("/doc.html","/api/**","/webjars/**","/v2/api-docs-ext?group=default").permitAll()
                .anyRequest().authenticated();//所有的请求都必须被认证。必须登录 后才能访问。

        http.authorizeRequests()
                .and().formLogin()  // 开启登录表单功能
                .loginPage("/login_page") // 使用自定义的登录页面，不再使用SpringSecurity提供的默认登录页
                .loginProcessingUrl("/login") // 配置登录请求处理接口，自定义登录页面、移动端登录都使用该接口
                .usernameParameter("name") // 修改认证所需的用户名的参数名（默认为username）
                .passwordParameter("passwd") // 修改认证所需的密码的参数名（默认为password）
                // 定义登录成功的处理逻辑（可以跳转到某一个页面，也可以返会一段 JSON）
                .successHandler(new AuthenticationSuccessHandler() {
                    @Override
                    public void onAuthenticationSuccess(HttpServletRequest req,
                                                        HttpServletResponse resp,
                                                        Authentication auth)
                            throws IOException, ServletException {
                        // 我们可以跳转到指定页面
                        // resp.sendRedirect("/index");

                        // 也可以返回一段JSON提示
                        // 获取当前登录用户的信息，在登录成功后，将当前登录用户的信息一起返回给客户端
                        Object principal = auth.getPrincipal();
                        resp.setContentType("application/json;charset=utf-8");
                        PrintWriter out = resp.getWriter();
                        resp.setStatus(200);
                        Map<String, Object> map = new HashMap<>();
                        map.put("status", 200);
                        map.put("msg", principal);
                        ObjectMapper om = new ObjectMapper();
                        out.write(om.writeValueAsString(map));
                        out.flush();
                        out.close();
                    }
                })
                // 定义登录失败的处理逻辑（可以跳转到某一个页面，也可以返会一段 JSON）
                .failureHandler(new AuthenticationFailureHandler() {
                    @Override
                    public void onAuthenticationFailure(HttpServletRequest req,
                                                        HttpServletResponse resp,
                                                        AuthenticationException e)
                            throws IOException, ServletException {
                        resp.setContentType("application/json;charset=utf-8");
                        PrintWriter out = resp.getWriter();
                        resp.setStatus(401);
                        Map<String, Object> map = new HashMap<>();
                        // 通过异常参数可以获取登录失败的原因，进而给用户一个明确的提示。
                        map.put("status", 401);
                        if (e instanceof LockedException) {
                            map.put("msg", "账户被锁定，登录失败!");
                        }else if(e instanceof BadCredentialsException){
                            map.put("msg","账户名或密码输入错误，登录失败!");
                        }else if(e instanceof DisabledException){
                            map.put("msg","账户被禁用，登录失败!");
                        }else if(e instanceof AccountExpiredException){
                            map.put("msg","账户已过期，登录失败!");
                        }else if(e instanceof CredentialsExpiredException){
                            map.put("msg","密码已过期，登录失败!");
                        }else{
                            map.put("msg","登录失败!");
                        }
                        ObjectMapper mapper = new ObjectMapper();
                        out.write(mapper.writeValueAsString(map));
                        out.flush();
                        out.close();
                    }
                })
                .permitAll(); // 允许访问登录表单、登录接口

        // 关闭 csrf 防护
        http.csrf().disable();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().withUser("user").password("password").roles("USER");
    }

}
