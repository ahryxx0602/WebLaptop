package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.ProductCriterialDTO;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.service.specifications.ProductSpecs;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(
            ProductRepository productRepository,
            CartDetailRepository cartDetailRepository,
            CartRepository cartRepository,
            UserService userService,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public Page<Product> fetchProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Page<Product> fetchProductsWithSpec(Pageable pageable, ProductCriterialDTO productCriterialDTO) {
        if (productCriterialDTO.getTarget() == null &&
                productCriterialDTO.getFactory() == null &&
                productCriterialDTO.getPrice() == null) {
            return this.productRepository.findAll(pageable);
        }
        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriterialDTO.getTarget() != null && productCriterialDTO.getTarget().isPresent()) {
            Specification<Product> currentSpec = ProductSpecs.matchListTarget(productCriterialDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        if (productCriterialDTO.getFactory() != null && productCriterialDTO.getFactory().isPresent()) {
            Specification<Product> currentSpec = ProductSpecs.matchListFactory(productCriterialDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        if (productCriterialDTO.getPrice() != null && productCriterialDTO.getPrice().isPresent()) {
            Specification<Product> currentSpec = this.buildPriceSpecification(productCriterialDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        return this.productRepository.findAll(combinedSpec, pageable);
    }

    // case 1:
    // public Page<Product> fetchProductsWithSpec(Pageable pageable, double min) {
    // return this.productRepository.findAll(ProductSpecs.minPrice(min), pageable);
    // }

    // case 2:
    // public Page<Product> fetchProductsWithSpec(Pageable pageable, double max) {
    // return this.productRepository.findAll(ProductSpecs.maxPrice(max), pageable);
    // }

    // // case 3:
    // public Page<Product> fetchProductsWithSpec(Pageable pageable, String factory)
    // {
    // return this.productRepository.findAll(ProductSpecs.matchFactory(factory),
    // pageable);
    // }

    // case 4:
    // public Page<Product> fetchProductsWithSpec(Pageable pageable, List<String>
    // factory) {
    // return this.productRepository.findAll(ProductSpecs.matchListFactory(factory),
    // pageable);
    // }

    // case 5
    // public Page<Product> fetchProductsWithSpec(Pageable page, String price) {
    // // eg: price 10-toi-15-trieu
    // if (price.equals("10-toi-15-trieu")) {
    // double min = 10000000;
    // double max = 15000000;
    // return this.productRepository.findAll(ProductSpecs.matchPrice(min, max),
    // page);

    // } else if (price.equals("15-toi-30-trieu")) {
    // double min = 15000000;
    // double max = 30000000;
    // return this.productRepository.findAll(ProductSpecs.matchPrice(min, max),
    // page);
    // } else
    // return this.productRepository.findAll(page);
    // }

    // case 6
    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);
        int count = 0;
        for (String p : price) {
            double min = 0;
            double max = 0;

            // Set the appropriate min and max based on the price range string
            switch (p) {
                case "duoi-10-trieu":
                    min = 0;
                    max = 10000000;
                    break;
                case "10-toi-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    break;
                case "15-toi-20-trieu":
                    min = 15000000;
                    max = 20000000;
                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = 200000000;
                    break;
                // Add more cases as needed
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }
        return combinedSpec;
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
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
                    cartDetail.setQuantity(quantity);
                    // Lưu cartDetail
                    this.cartDetailRepository.save(cartDetail);

                    // Update cart Sum
                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);

                } else {
                    // 5.2. Nếu có rồi thì Quantity + 1
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    // Lưu
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();

            // Delete Cart
            this.cartDetailRepository.deleteById(cartDetailId);

            // Update cart
            if (currentCart.getSum() > 1) {
                // Update Current cart
                int sum = currentCart.getSum() - 1;
                currentCart.setSum(sum);
                session.setAttribute("sum", sum);
                this.cartRepository.save(currentCart);
            } else {
                // Delete cart sum = 1
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cartDetailOptional.isPresent()) {
                CartDetail currentCartDetail = cartDetailOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone) {
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {
                // Create Order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // Create order Detail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                // Step 2: Delete Cart Detail and Cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                // Step 3: Update Session
                session.setAttribute("sum", 0);
            }
        }
    }

}