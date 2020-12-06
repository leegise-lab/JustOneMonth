package com.justonemonth.service;

import com.justonemonth.model.*;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderService {
    @Autowired
    public OrderDAO mapper;

    public List<OrderDTO> getUserInfo(String id) {
        return mapper.getUserInfo(id);
    }
    public int insertOrderId(InsertPayInfoDTO dto) { return mapper.insertOrderInfo(dto);}
    public List<SelectOrderDTO> selectOrderInfo(String id) { return mapper.selectOrderInfo(id); }
    public List<SelectOrderDetailDTO> selectOrderDetailInfo(HashMap map) { return mapper.selectOrderDetailInfo(map); }
    public List<SetCartInfoDTO> setCartInfo(String id) { return mapper.setCartInfo(id); }
    public List<SetCartInfoDTO> setCartDetailInfo(HashMap map) { return mapper.setCartDetailInfo(map); }
    public int updateUserBuy(HashMap map) {return mapper.updateUserBuy(map); }
    public int insertBuyInfoToCart(HashMap map) {return mapper.insertBuyInfoToCart(map); }
    public int deleteCartAll(String id) {return mapper.deleteCartAll(id); }
}