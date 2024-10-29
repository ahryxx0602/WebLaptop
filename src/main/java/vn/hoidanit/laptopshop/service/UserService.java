package vn.hoidanit.laptopshop.service;

import java.util.List;
import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userrepository;

    public UserService(UserRepository userrepository) {
        this.userrepository = userrepository;
    }

    public String handleHello() {
        return "Hello from Service";
    }

    public List<User> getAllUser() {
        return this.userrepository.findAll();
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userrepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        User ahryxx = this.userrepository.save(user);
        System.out.println(ahryxx);
        return ahryxx;
    }
}
