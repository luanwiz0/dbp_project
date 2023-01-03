package controller;

import java.util.HashMap;

import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.product.*;
import controller.qna.DeleteQnaController;
import controller.qna.ListQnaController;
import controller.qna.RegisterQnaController;
import controller.qna.UpdateQnaController;
import controller.qna.ViewQnaController;
import controller.classes.*;
import controller.main.ManageMainPageController;
import controller.mypage.ManageMypageController;
import controller.mypage.ViewMypageController;
import controller.user.*;
import controller.cart.*;
import controller.order.*;


public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장
        mappings.put("/", new ForwardController("index.jsp"));
 
        // 상품 관련 request URI
        mappings.put("/product/search", new SearchProductController());
        mappings.put("/product/list", new ListProductController());
        mappings.put("/product/view", new ViewProductController());
        mappings.put("/product/add", new ManageProductController());
        mappings.put("/product/update", new ManageProductController());
        mappings.put("/product/delete", new ManageProductController());
       
        // 클래스 관련 request URI
        mappings.put("/class/list", new ListClassController());
        mappings.put("/class/add", new ManageClassController());
        mappings.put("/class/update", new ManageClassController());
        mappings.put("/class/delete", new ManageClassController());
        mappings.put("/class/reservation", new ReservationController());
        
        // 회원 관련 request URI
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        
        mappings.put("/user/list", new ListUserController());
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/user/register", new RegisterUserController()); 
        mappings.put("/user/update", new UpdateUserController());     
        mappings.put("/user/delete", new DeleteUserController());
        
        // 장바구니 관련 request URI
        mappings.put("/cart/add", new ManageCartController());
        mappings.put("/cart/update", new ManageCartController());
        mappings.put("/cart/delete", new ManageCartController());
        mappings.put("/cart/view", new ViewCartController());
        
        //주문 관련 request URI
        mappings.put("/order/checkedForm", new OrderController());
        mappings.put("/order/form", new OrderController());
        mappings.put("/order/add", new OrderController());
        mappings.put("/order/list", new ListOrderController());
        
        // 커뮤니티 관련 request URI 추가
        mappings.put("/community/create/form", new ForwardController("/community/creationForm.jsp"));
        
        //마이페이지
        mappings.put("/mypage/view", new ViewMypageController());
        mappings.put("/mypage/order", new ManageMypageController());
        mappings.put("/mypage/order/detail", new ManageMypageController());
        mappings.put("/mypage/reservation", new ManageMypageController());
        mappings.put("/mypage/post", new ManageMypageController());
     
        //main 관련
        mappings.put("/main/store", new ManageMainPageController());
        mappings.put("/main/view", new ManageMainPageController());
        
        //QNA 관련 request URI
        mappings.put("/qna/list", new ListQnaController());
        mappings.put("/qna/view", new ViewQnaController());
        mappings.put("/qna/register", new RegisterQnaController());      
        mappings.put("/qna/update", new UpdateQnaController());
        mappings.put("/qna/delete", new DeleteQnaController());

        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}
