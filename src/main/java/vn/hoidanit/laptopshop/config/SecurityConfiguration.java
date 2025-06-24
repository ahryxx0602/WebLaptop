package vn.hoidanit.laptopshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

import jakarta.servlet.DispatcherType;
import vn.hoidanit.laptopshop.service.CustomUserDetailsService;
import vn.hoidanit.laptopshop.service.UserService;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    // @Bean
    // public AuthenticationManager authenticationManager(HttpSecurity http,
    // PasswordEncoder passwordEncoder,
    // UserDetailsService userDetailsService) throws Exception {
    // AuthenticationManagerBuilder authenticationManagerBuilder = http
    // .getSharedObject(AuthenticationManagerBuilder.class);
    // authenticationManagerBuilder
    // .userDetailsService(userDetailsService)
    // .passwordEncoder(passwordEncoder);
    // return authenticationManagerBuilder.build();
    // }

    @Bean
    public DaoAuthenticationProvider authProvider(
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        authProvider.setHideUserNotFoundExceptions(false);
        return authProvider;
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http, UserDetailsService userDetailsService) throws Exception {
        // SpringSecurity v6/ Cú pháp lamda
        http
                .authorizeHttpRequests(authorize -> authorize
                        // Cho phép truy cập tới view
                        .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                DispatcherType.INCLUDE)
                        .permitAll()
                        // Cho phép ai ai cũng truy cập các file có dạng dưới đây
                        .requestMatchers("/", "/login", "/product/**", "/client/**", "/css/**", "/js/**", "/images/**")
                        .permitAll()
                        // Bất kỳ request nào cũng cần phải xác thực
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .anyRequest().authenticated())

                .sessionManagement((sessionManagement) -> sessionManagement
                        // Nếu user chưa có session thì luôn luôn tạo mới
                        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                        // Khi hết hạn session thì log out
                        .invalidSessionUrl("/logout?expired")
                        // Giới hạn 1 tài khoản đăng nhập được bao nhiêu thiết bị (1)
                        .maximumSessions(1)
                        // Người thứ 2 đăng nhập vào thì thì đá người thứ nhất ra (false)
                        // Chờ người thứ nhất dùng hết phiên đăng nhập mới vào (true)
                        .maxSessionsPreventsLogin(false))

                // Mõi 1 lần logout thì xóa cookies này
                .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))

                .formLogin(formLogin -> formLogin
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .successHandler(customSuccessHandler())
                        .permitAll())
                .rememberMe((rememberMe) -> rememberMe
                        .rememberMeServices(rememberMeServices()))
                .exceptionHandling(ex -> ex.accessDeniedPage("/access-denied"));

        return http.build();
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return new CustomSuccessHandler();
    }

    @Bean
    public SpringSessionRememberMeServices rememberMeServices() {
        SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
        // optionally customize
        rememberMeServices.setAlwaysRemember(true);
        return rememberMeServices;
    }
}
