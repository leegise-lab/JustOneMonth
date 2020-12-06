package com.justonemonth.controller;

import com.justonemonth.model.*;
import com.justonemonth.service.OrderService;
import com.justonemonth.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RestController
public class OrderController {
    @Autowired
    TestService testService;
    @Autowired
    OrderService orderService;

//    @RequestMapping("/cart")
//    public ModelAndView cart(HttpServletResponse response) {
//        ModelAndView mv = new ModelAndView("cart");
//        Cookie cookie = new Cookie("productName", "쿠키밸류");
//        cookie.setPath("/");
//        response.addCookie(cookie);
//        return mv;
//    }


    @RequestMapping("/orderWrite")
    public ModelAndView orderWrite(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("orderWrite");

        //장바구니에 추가한 상품 정보를 세션에 추가하는 부분
        HttpSession session = request.getSession(true);
        String sessionUserid = (String) session.getAttribute("loginId");
        //주문할 상품 정보
        String productName = request.getParameter("productName");
        //장바구니에서 주문서 작성페이지로 넘어오는 경우
        if (productName == null) {
            //장바구니 정보를 가져옴
            List<CartDTO> cartList = testService.cartshow1(sessionUserid);
            mv.addObject("cartList", cartList);
            mv.addObject("buyType", 1);
            //바로구매로 넘어오는 경우
        } else if (productName != null) {
            System.out.println("productnull아님");
            String amount = request.getParameter("amount");
            String img = request.getParameter("productImage");
            String color = request.getParameter("productColor");
            String size = request.getParameter("productSize");
            String price = request.getParameter("productPrice");
            SetCartInfoDTO cartList = new SetCartInfoDTO(amount, price, productName, img, "" + new Date().getDate() + new Date().getTime(), color, size, sessionUserid);
            mv.addObject("cartList", cartList);
            mv.addObject("buyType",0);
        }
        //유저 정보 담아주는 부분
        //유저 이메일 아이디와 @naver.com 부분을 나눠 작업
        List<OrderDTO> list = orderService.getUserInfo(sessionUserid);
        for (int i = 0; i < list.size(); i++) {
            String getMail = list.get(i).getMem_email();
            String[] mail = getMail.split("@");
            mv.addObject("email0", mail[0]);
            mv.addObject("email1", mail[1]);
        }
        mv.addObject("setUserInfo", list);
        return mv;
    }

    //아이엠포트 결제 API창 구현 부분
    @RequestMapping("pay")
    public ModelAndView pay(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("payment");
        //결제 api창에 필요한 정보
        String name = request.getParameter("name");
        String mail = request.getParameter("mail");
        String post_code = request.getParameter("post_code");
        String add1 = request.getParameter("add1");
        String add2 = request.getParameter("add2");
        String address = add1 + " " + add2;
        String hp = request.getParameter("hp");
        String payType = request.getParameter("payType");
        String price = request.getParameter("price");
        String productName = request.getParameter("productName");
        OrderInfoDTO orderInfo = new OrderInfoDTO(name, mail, post_code, address, hp, payType, productName, price);
        mv.addObject("orderInfo", orderInfo);
        return mv;
    }

    //주문 확인부분
    @RequestMapping("/orderFinish")
    public ModelAndView orderFinish(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("orderFinish");
        //세션에서 id 가져오는 부분
        HttpSession session = request.getSession();
        String id = ""+session.getAttribute("loginId");
        String name = "", mail = "", productName = "", price = "", payFinish = "", orderHp = "",
                orderAddress = "", orderNum = "", deliveryNum = "";
        String cartAmount = "", cartProductPrice = "", cartProductName = "", cartImg = "", cartOrderNum = "", cartColor = "", cartSize = "", cartUserId = "";
        //결제정보 세팅
        name = request.getParameter("name");
        mail = request.getParameter("mail");
        productName = request.getParameter("productName");
        price = request.getParameter("price");
        payFinish = request.getParameter("payFinish");
        if (payFinish == null) {
            payFinish = "0";
        }
        orderHp = request.getParameter("hp");
        orderAddress = request.getParameter("address");
        orderNum = request.getParameter("orderNum");
        if (orderNum == null) {
            orderNum = "" + new Date().getDate() + new Date().getTime();
        }
        deliveryNum = request.getParameter("deliveryNum");
        if (deliveryNum == null) {
            deliveryNum = orderNum;
        }
        String payType = request.getParameter("payType");

        //DB에 결제 내용을 저장
        InsertPayInfoDTO insertInfo = new InsertPayInfoDTO(deliveryNum, orderNum, id, name, mail,
                orderHp, orderAddress, payType, price, productName, payFinish);
        orderService.insertOrderId(insertInfo);


        //orderFinish화면에 세팅해줄 결제 정보
        PayInfoDTO payInfo = new PayInfoDTO(id, name, mail, payType, productName, price,
                payFinish, orderHp, orderAddress, orderNum, deliveryNum);
        mv.addObject("payInfo", payInfo);

        //장바구니에 담은 아이템 구매인지, 바로구매인지 확인
        String buyType = request.getParameter("buyType");
        //buyType이 널이면 장바구니 통한것, 널이 아니면 바로구매 한것
        if (buyType.equals("1")) {
            List<SetCartInfoDTO> cartList = orderService.setCartInfo(id);
            for (int i=0; i<cartList.size(); i++) {
                //장바구니에도 orderNum을 update(구매 안한 상품은 default orderNum이 null, 구매하면 주문번호 업데이트)
                HashMap<String, String> map = new HashMap();
                cartAmount = cartList.get(i).getCartAmount();
                productName = cartList.get(i).getCartProductName();
                String color = cartList.get(i).getCartColor();

                map.put("orderNum", orderNum);
                map.put("amount", cartAmount);
                map.put("productName", productName);
                map.put("userId", id);
                map.put("color", color);
                orderService.updateUserBuy(map);
            }
            mv.addObject("cartList", cartList);
            mv.addObject("buyType", 1);

        } else if(buyType.equals("0")){
            cartAmount = request.getParameter("productAmount");
            cartProductName = request.getParameter("productName");
            cartProductPrice = request.getParameter("cart_price");
            cartImg = request.getParameter("productImg");
            cartOrderNum = request.getParameter("productImg");
            if (cartOrderNum == null) {
                cartOrderNum = ""+new Date().getDate() + new Date().getTime();
            }
            cartColor = request.getParameter("productColor");
            cartSize = request.getParameter("productSize");
            SetCartInfoDTO dto = new SetCartInfoDTO(cartAmount, cartProductPrice, cartProductName, cartImg, cartOrderNum, cartColor, cartSize, cartUserId);
            HashMap<String, String> map = new HashMap();
            map.put("amount", cartAmount);
            map.put("price", cartProductPrice);
            map.put("productName", cartProductName);
            map.put("img", cartImg);
            map.put("orderNum", orderNum);
            map.put("color", cartColor);
            map.put("size", cartSize);
            map.put("id", id);
            orderService.insertBuyInfoToCart(map);
            mv.addObject("buyType", 0);
            mv.addObject("cartList", dto);
        }

        return mv;
    }
    //주문정보 조회 부분
    @RequestMapping(value = "/orderLookUp", method = RequestMethod.GET)
    public ModelAndView orderLookUp(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("orderLookUp");
        HttpSession session = request.getSession();
        String id=(String)session.getAttribute("loginId");

        List<SelectOrderDTO> orderList = orderService.selectOrderInfo(id);
        System.out.println(orderList);
        mv.addObject("orderList",orderList);
        return mv;
    }

    @RequestMapping("/orderDetail")
    public ModelAndView orderDetail(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("orderDetail");
        HttpSession session = request.getSession();
//        String id = (String) session.getAttribute("login");
        String id=(String)session.getAttribute("loginId");
        //결제정보 가져오는 부분
        String orderNum = request.getParameter("orderNum");
        HashMap<String, String> map = new HashMap();
        map.put("id", id);
        map.put("orderNum", orderNum);
        //결제 정보를 가져오는 부분
        List<SelectOrderDetailDTO> orderList = orderService.selectOrderDetailInfo(map);
        //결제한 상품정보 가져오는 부분
        List<SetCartInfoDTO> itemList = orderService.setCartDetailInfo(map);
        mv.addObject("orderList", orderList);
        mv.addObject("itemList", itemList);
        return mv;
    }



}
