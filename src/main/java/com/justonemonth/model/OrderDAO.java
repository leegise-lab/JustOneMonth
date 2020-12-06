package com.justonemonth.model;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@Mapper
public interface OrderDAO {
    List<OrderDTO> getUserInfo(String mem_userid);
    int insertOrderInfo(InsertPayInfoDTO dto);
    List<SelectOrderDTO> selectOrderInfo(String id);
    List<SelectOrderDetailDTO> selectOrderDetailInfo(HashMap map);
    List<SetCartInfoDTO> setCartInfo(String id);
    List<SetCartInfoDTO> setCartDetailInfo(HashMap map);
    int updateUserBuy(HashMap map);
    int insertBuyInfoToCart(HashMap map);
    int deleteCartAll(String id);
}