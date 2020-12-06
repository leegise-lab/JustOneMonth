package com.justonemonth.model;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminDAO {
    List<SetOrderListDTO> setOrderList();
    List<SetBuyInfoDTO> setBuyItemInfo(String cartOrderNum);
    List<SetOrderListDTO> searchOrderList(SearchDTO searchDTO);
    int delOrderInfo(String orderNum);
    int updatePayFinish(String orderNum);
    int updateDeliveryFinish(String orderNum);
    int getListCnt();
    int getSearchCnt(SearchDTO dto);
}