package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

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

    public void handleAddProductToCart(String email, long productId) {
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
                otherCart.setSum(1);

                cart = this.cartRepository.save(otherCart);
            }
            // 4. Tìm sản phẩm theo productId
            Optional<Product> optionalProduct = this.productRepository.findById(productId);
            if (optionalProduct.isPresent()) {
                Product foundProduct = optionalProduct.get();

                // 5. Tạo mới cartDetail
                CartDetail cartDetail = new CartDetail();
                cartDetail.setCart(cart);
                cartDetail.setProduct(foundProduct);
                cartDetail.setPrice(foundProduct.getPrice());
                cartDetail.setQuantity(1);

                // 6. Lưu cartDetail
                this.cartDetailRepository.save(cartDetail);
            }

        }
    }
}
