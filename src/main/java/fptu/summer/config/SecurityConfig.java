/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.config;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 *
 * @author ADMIN
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public AuthenticationFilter normalAuthenticationFilter() throws Exception {
        AuthenticationFilter normalAuthenticationFilter = new AuthenticationFilter();
        normalAuthenticationFilter.setAuthenticationManager(authenticationManager());
        return normalAuthenticationFilter;
    }

    @Bean
    public AuthenticationEntryPoint normalEntryPoint() {
        return new AuthenticationEntryPoint() {
            public void commence(HttpServletRequest hsr,
                    HttpServletResponse response, AuthenticationException ae)
                    throws IOException, ServletException {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                try (PrintWriter pw = response.getWriter();) {
                    pw.write("Unauthorized");
                }
            }
        };
    }

    @Bean
    public AccessDeniedHandler customAccessDeniedHandler() {
        return new AccessDeniedHandler() {
            @Override
            public void handle(HttpServletRequest hsr, HttpServletResponse response, org.springframework.security.access.AccessDeniedException ade) throws IOException, ServletException {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                try (PrintWriter pw = response.getWriter();) {
                    pw.write("Access Denied!");
                }
            }
        };
    }

    @Bean
    @Override
    protected AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().ignoringAntMatchers("/**");

        http.authorizeRequests()
                .antMatchers("/index", "/login", "/").permitAll()
                .antMatchers(HttpMethod.POST, "/login").permitAll()
                .and().logout().disable()
                .authorizeRequests().anyRequest().authenticated()
                .and().httpBasic().authenticationEntryPoint(normalEntryPoint())
                .and().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and().addFilterBefore(normalAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class)
                .exceptionHandling().accessDeniedHandler(customAccessDeniedHandler());
    }
}
