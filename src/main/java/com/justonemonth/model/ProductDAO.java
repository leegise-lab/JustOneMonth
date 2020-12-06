package com.justonemonth.model;

public class ProductDAO {

//    public boolean idCheck(String userid) {
//        if((Integer)sqlsession.selectOne("Member.idCheck", userid) == 1)
//        {//단일 하나의 데이터만 등록하는것 selectOne 데이터 한줄만 가져옴. 그중에 마이바티스 mapper로 등록되어있는 member.idCheck로 userid를 보낼 것이다.
//            return true;
//        }else {
//            return false;
//        }
//    }
//
//    public int join(MemberDTO member) {
//        HashMap<String, String> dataMap = new HashMap<>();
//        String hobbystr = "";
//        for(String hobby : member.getHobby()) {
//            hobbystr = hobbystr + hobby + " ";
//        }
//        //item 추가 key값은 database field 명. 실제
//        dataMap.put("mem_userid", member.getUserid());
//        dataMap.put("mem_userpw", member.getUserpw());
//        dataMap.put("mem_name", member.getUsername());
//        dataMap.put("mem_email", member.getEmail());
//        dataMap.put("mem_hp", member.getHp());
//        dataMap.put("mem_hobby", hobbystr);
//        dataMap.put("mem_ssn1", member.getSsn1());
//        dataMap.put("mem_ssn2", member.getSsn2());
//        dataMap.put("mem_zipcode", member.getZipcode());
//        dataMap.put("mem_address1", member.getAddress1());
//        dataMap.put("mem_address2", member.getAddress2());
//        dataMap.put("mem_address3", member.getAddress3());
//
//        return sqlsession.insert("Member.join", dataMap);
//        //insert method. 넣는 parameter는 똑같다. name space이름, 거기에 쓰는 id
//        //return값은 insert된 row의개수
//        //잘 저장된것을 return
//    }
    /*public ProductDTO cart(ProductDTO product) {
        HashMap<String, String> dataMap = new HashMap<>();
        dataMap.put("cart_amount", product.getAmount());
        dataMap.put("cart_productprice", product.getPrice());
        dataMap.put("cart_productname", product.getProductName());
        dataMap.put("cart_color", product.getColor());
        dataMap.put("cart_size", product.getSize());
        dataMap.put("cart_userid", product.getUserid());
    }*/
}
