package com.justonemonth.service;

import com.justonemonth.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    public AdminDAO mapper;

    public List<SetOrderListDTO> setOrderList() { return mapper.setOrderList(); }
    public List<SetBuyInfoDTO> setCartInfo(String cartOrderNum) { return mapper.setBuyItemInfo(cartOrderNum); }
    public List<SetOrderListDTO> searchOrderList(SearchDTO dto) { return mapper.searchOrderList(dto); }
    public int delOrderInfo(String orderNum) { return mapper.delOrderInfo(orderNum); }
    public int updatePayFinish(String orderNum) { return mapper.updatePayFinish(orderNum); }
    public int updateDeliveryFinish(String orderNum) { return mapper.updateDeliveryFinish(orderNum); }
    public int getListCnt() { return mapper.getListCnt(); }
    public int getSearchCnt(SearchDTO dto) { return mapper.getSearchCnt(dto); }
}