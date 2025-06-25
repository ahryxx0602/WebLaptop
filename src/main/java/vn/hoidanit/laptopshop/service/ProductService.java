package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(
            ProductRepository productRepository,
            CartDetailRepository cartDetailRepository,
            CartRepository cartRepository,
            UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        // 1. Lấy thông tin user theo email
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // 2. Kiểm tra user đã có cart chưa
            Cart cart = this.cartRepository.findByUser(user);
            // 3. Nếu chưa có cart, tạo mới cart cho user
            if (cart == null) {
                // Tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                // Sum cart ban đầu = 0 vì sau khi tạo mới thành công thì Sum +1
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }
            // 4. Tìm sản phẩm theo productId
            Optional<Product> optionalProduct = this.productRepository.findById(productId);
            if (optionalProduct.isPresent()) {
                Product foundProduct = optionalProduct.get();
                // 5. Kiểm tra sản phẩm đã thêm vào giỏ hàng trước đó chưa

                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, foundProduct);
                if (oldDetail == null) {
                    // 5.1. Nếu chưa thì tạo mới cartDetail
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(foundProduct);
                    cartDetail.setPrice(foundProduct.getPrice());
                    cartDetail.setQuantity(1);
                    // Lưu cartDetail
                    this.cartDetailRepository.save(cartDetail);

                    // Update cart Sum
                    int sum = cart.getSum() + 1;
                    cart.setSum(cart.getSum() + 1);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);

                } else {
                    // 5.2. Nếu có rồi thì Quantity + 1
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    // Lưu
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }
    }
}
