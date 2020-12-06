package com.justonemonth.controller;

import com.justonemonth.model.SearchDTO;
import com.justonemonth.model.SetOrderListDTO;
import com.justonemonth.model.TestDTO;
import com.justonemonth.service.AdminService;
import com.justonemonth.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class AdminMainController {
    @RequestMapping(value = "/adminUpload")
    public ModelAndView adminUpload() throws Exception {
//        mv에 test.jsp 파일을 세팅해주고, url은 localhost:8080/test로 함
        ModelAndView mv = new ModelAndView("upload");
        return mv;
    }

    @RequestMapping(value = "/adminMain")
    public ModelAndView adminMain() throws Exception {
//        mv에 test.jsp 파일을 세팅해주고, url은 localhost:8080/test로 함
        ModelAndView mv = new ModelAndView("admin_main");
        return mv;
    }

    @Autowired
    AdminService adminService;
    @Autowired
    OrderService orderService;

    //관리자 주문 조회부분
    @RequestMapping("/orderDeliveryLookup")
    @ResponseBody
    public ModelAndView orderDelivery1(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("order_and_delivery");
        // 페이징 세팅
        String pagePerCnt = "5"; // 페이지 개수 변경은 여기서~~~
        String start = "";
        String pageNum = request.getParameter("pageNum");
        String totcnt = "";

        if (pageNum != null && !pageNum.equals("")) {
            start = String.valueOf((Integer.parseInt(pageNum) - 1) * Integer.parseInt(pagePerCnt));
        } else {
            pageNum = "1";
            start = "0";
        }

        mv.addObject("pagePerCnt", pagePerCnt);
        mv.addObject("start", start);

        //게시글의 총 개수를 가져옴
        totcnt = String.valueOf(adminService.getListCnt());
        SearchDTO dto = new SearchDTO(request.getParameter("search"), request.getParameter("searchCategory"), request.getParameter("startDate"),
                request.getParameter("endDate"), request.getParameter("delivery"), start, pagePerCnt, pageNum);
        //결제정보들 가져옴
        List<SetOrderListDTO> orderList = adminService.searchOrderList(dto);

        int pageNums = 0;
        if (Integer.parseInt(totcnt) % Integer.parseInt(pagePerCnt) == 0) {
            pageNums = Integer.parseInt(totcnt) / Integer.parseInt(pagePerCnt);
        } else {
            pageNums = Integer.parseInt(totcnt) / Integer.parseInt(pagePerCnt) + 1;
        }
        mv.addObject("pageNums", pageNums);

        ArrayList<Map<String, Object>> tmpBuyInfo = new ArrayList();
        for (int i = 0; i < orderList.size(); i++) {
            HashMap<String, Object> map = new HashMap();
            //파라미터로 주문번호를 넘겨서 현재 리스트의 상품만을 가지고옴
            map.put("orderInfo", orderList.get(i));
            map.put("buyInfo", adminService.setCartInfo(orderList.get(i).getOrderNum()));
            tmpBuyInfo.add(map);
        }
        //주문번호별로 분류한(키값 orderNum으로 분류) 구매품목 리스트
        mv.addObject("buyInfo", tmpBuyInfo);
        return mv;
    }

    @RequestMapping("/orderSearchListAjax")
    @ResponseBody
    public ModelAndView ordersearchListAjax(HttpServletRequest request, SearchDTO search, String[] orderNumList,
                                            String[] updatePayList, String[] updateDeliveryList) {
        ModelAndView mv = new ModelAndView("parts/orderParts");
        //주문번호 받아와서 삭제하는 부분
        if (orderNumList != null) {
            for (int i = 0; i < orderNumList.length; i++) {
                String orderNum = orderNumList[i];
                adminService.delOrderInfo(orderNum);
            }
        }
        //결제대기 결제완료로 업데이트해주는 부분
        if (updatePayList != null) {
            for (int i = 0; i < updatePayList.length; i++) {
                String orderNum = updatePayList[i];
                adminService.updatePayFinish(orderNum);
            }
        }
        //배송중 항목을 배송 완료로 업데이트하는 부분
        if (updateDeliveryList != null) {
            for (int i = 0; i < updateDeliveryList.length; i++) {
                String orderNum = updateDeliveryList[i];
                adminService.updateDeliveryFinish(orderNum);
            }
        }
        // 페이징 세팅
        String pagePerCnt = "5"; // 페이지 개수 변경은 여기서~~~
        String start = "";
        String pageNum = request.getParameter("pageNum");
        String totcnt = "";

        if (pageNum != null && !pageNum.equals("")) {
            start = String.valueOf((Integer.parseInt(pageNum) - 1) * Integer.parseInt(pagePerCnt));
        } else {
            pageNum = "1";
            start = "0";
        }

        mv.addObject("pagePerCnt", pagePerCnt);
        mv.addObject("start", start);

        //게시글의 총 개수를 가져옴
        SearchDTO dto = new SearchDTO(request.getParameter("search"), request.getParameter("searchCategory"), request.getParameter("startDate"),
                request.getParameter("endDate"), request.getParameter("delivery"), start, pagePerCnt, pageNum);
        totcnt = String.valueOf(adminService.getSearchCnt(dto));
        //검색버튼 눌렀을 때 데이터를 가져옴
        List<SetOrderListDTO> orderList = adminService.searchOrderList(dto);
        int pageNums = 0;
        if (Integer.parseInt(totcnt) % Integer.parseInt(pagePerCnt) == 0) {
            pageNums = Integer.parseInt(totcnt) / Integer.parseInt(pagePerCnt);
        } else {
            pageNums = Integer.parseInt(totcnt) / Integer.parseInt(pagePerCnt) + 1;
        }
        mv.addObject("pageNums", pageNums);

        ArrayList<Map<String, Object>> tmpBuyInfo = new ArrayList();
        for (int i = 0; i < orderList.size(); i++) {
            HashMap<String, Object> map = new HashMap();
            //파라미터로 주문번호를 넘겨서 현재 리스트의 상품만을 가지고옴
            map.put("orderInfo", orderList.get(i));
            map.put("buyInfo", adminService.setCartInfo(orderList.get(i).getOrderNum()));
            tmpBuyInfo.add(map);
        }
        //주문번호별로 분류한(키값 orderNum으로 분류) 구매품목 리스트
        mv.addObject("buyInfo", tmpBuyInfo);
        return mv;
    }
}