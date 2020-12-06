package com.justonemonth.controller;

import com.justonemonth.model.*;
import com.justonemonth.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.*;

@RestController
public class BoardController {
//FileService.FileService1 fileService1;
//FileService.FileService2 fileService2;

    @Resource(name="fileitem")
    private ItemFile itemFile;
    @Resource(name="filereview")
    private reviewFile reviewFile;

    @Autowired
    TestService testService;

    @RequestMapping(value = "/main")
    public ModelAndView main(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("main");
        return mv;
    }

    @RequestMapping(value = "/upload_item_ok")
    public ModelAndView UP(HttpServletRequest httpServletRequest ) throws Exception {


        ModelAndView mv = new ModelAndView("upload_item_ok");

        String up_color="";
        String[] checkbox = httpServletRequest.getParameterValues("color_idx[]");
        if(checkbox!=null){
            for(int i=0; i<checkbox.length; i++){
                up_color = up_color +checkbox[i] + " ";
            }
        }
        String up_size="";
        String[] size = httpServletRequest.getParameterValues("up_size");
        if(size!=null){
            for(int i=0; i<size.length; i++){
                up_size = up_size +size[i] + " ";
            }

        }


        String up_file2[] = new String[5];
        String[] file2 = httpServletRequest.getParameterValues("up_file2");
        if(file2!=null){
            for(int i=0; i<file2.length; i++){
                up_file2[i] =file2[i] ;

            }

        }
        String up_file3[] = new String[3];
        String[] file3 = httpServletRequest.getParameterValues("up_file3");
        if(file3!=null){
            for(int i=0; i<file3.length; i++){
                up_file3[i] =file3[i] ;

            }

        }




        HashMap<String, String> dataMap = new HashMap<String, String>();
        dataMap.put("up_name", httpServletRequest.getParameter("up_name"));
        dataMap.put("up_category1", httpServletRequest.getParameter("up_category1"));
        dataMap.put("up_category2", httpServletRequest.getParameter("up_category2"));
        dataMap.put("up_color", up_color);
        dataMap.put("up_price", httpServletRequest.getParameter("up_price"));
        dataMap.put("up_size", up_size);
        dataMap.put("up_file1",httpServletRequest.getParameter("up_file1"));
        dataMap.put("up_file2",up_file2[0] );
        dataMap.put("up_file3",up_file2[1] );
        dataMap.put("up_file4",up_file2[2] );
        dataMap.put("up_file5",up_file2[3] );
        dataMap.put("up_file6",up_file2[4] );
        dataMap.put("up_file7",up_file3[0] );
        dataMap.put("up_file8",up_file3[1] );
        dataMap.put("up_file9",up_file3[2] );


        int a = testService.itemjoin(dataMap);
        mv.addObject("result",a);

        return mv;

    }



    @RequestMapping(value = "/SHOES")
    public ModelAndView SHOES() throws Exception {

        ModelAndView mv = new ModelAndView("SHOES");
        List<mainDTO> list =testService.selectItems(5);
        List<mainDTO> list1 =testService.selectItem(5,1);
        List<mainDTO> list2 =testService.selectItem(5,2);
        List<mainDTO> list3 =testService.selectItem(5,3);
        List<mainDTO> list4 =testService.selectItem(5,4);
        List<mainDTO> list5 =testService.selectItem(5,5);
        List<mainDTO> list6 =testService.selectItem(5,6);


        mv.addObject("list", list);
        mv.addObject("list1", list1);
        mv.addObject("list2", list2);
        mv.addObject("list3", list3);
        mv.addObject("list4", list4);
        mv.addObject("list5", list5);
        mv.addObject("list6", list6);

        return mv;
    }
    @RequestMapping(value = "/PANTS")
    public ModelAndView PANTS() throws Exception {

        ModelAndView mv = new ModelAndView("PANTS");
        List<mainDTO> list =testService.selectItems(2);
        List<mainDTO> list1 =testService.selectItem(2,1);
        List<mainDTO> list2 =testService.selectItem(2,2);
        List<mainDTO> list3 =testService.selectItem(2,3);
        List<mainDTO> list4 =testService.selectItem(2,4);



        mv.addObject("list", list);
        mv.addObject("list1", list1);
        mv.addObject("list2", list2);
        mv.addObject("list3", list3);
        mv.addObject("list4", list4);



        return mv;
    }
    @RequestMapping(value = "/CARDIGAN")
    public ModelAndView CARDIGAN() throws Exception {

        ModelAndView mv = new ModelAndView("CARDIGAN");
        List<mainDTO> list =testService.selectItems(4);
        List<mainDTO> list1 =testService.selectItem(4,1);
        List<mainDTO> list2 =testService.selectItem(4,2);
        List<mainDTO> list3 =testService.selectItem(4,3);



        mv.addObject("list", list);
        mv.addObject("list1", list1);
        mv.addObject("list2", list2);
        mv.addObject("list3", list3);



        return mv;
    }
    @RequestMapping(value = "/LEGGINGS")
    public ModelAndView LEGGINGS() throws Exception {

        ModelAndView mv = new ModelAndView("LEGGINGS");
        List<mainDTO> list =testService.selectItems(6);
        List<mainDTO> list1 =testService.selectItem(6,1);
        List<mainDTO> list2 =testService.selectItem(6,2);
        List<mainDTO> list3 =testService.selectItem(6,3);



        mv.addObject("list", list);
        mv.addObject("list1", list1);
        mv.addObject("list2", list2);
        mv.addObject("list3", list3);


        return mv;
    }
    @RequestMapping(value = "/OPS")
    public ModelAndView OPS() throws Exception {

        ModelAndView mv = new ModelAndView("OPS");
        List<mainDTO> list =testService.selectItems(3);
        List<mainDTO> list1 =testService.selectItem(3,1);
        List<mainDTO> list2 =testService.selectItem(3,2);
        List<mainDTO> list3 =testService.selectItem(3,3);


        mv.addObject("list", list);
        mv.addObject("list1", list1);
        mv.addObject("list2", list2);
        mv.addObject("list3", list3);

        return mv;
    }
    @RequestMapping(value = "/OUTER")
    public ModelAndView OUTER() throws Exception {

        ModelAndView mv = new ModelAndView("OUTER");
        List<mainDTO> list =testService.selectItems(1);
        List<mainDTO> list1 =testService.selectItem(1,1);
        List<mainDTO> list2 =testService.selectItem(1,2);
        List<mainDTO> list3 =testService.selectItem(1,3);
        List<mainDTO> list4 =testService.selectItem(1,4);
        List<mainDTO> list5 =testService.selectItem(1,5);


        mv.addObject("list", list);
        mv.addObject("list1", list1);
        mv.addObject("list2", list2);
        mv.addObject("list3", list3);
        mv.addObject("list4", list4);
        mv.addObject("list5", list5);
        return mv;
    }
    @RequestMapping(value = "/AllAbout")
    public ModelAndView best() throws Exception {

        ModelAndView mv = new ModelAndView("AllAbout");
        List<mainDTO> list =testService.selectItemAll();
        mv.addObject("list", list);



        return mv;
    }

    // product
    @RequestMapping(value = "/admin_product")
    public ModelAndView admin_product(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("admin_product");
        HashMap<String, String> dataMap = new HashMap<String, String>();
        List<mainDTO> list = null;

        // 페이징 세팅
        String pagePerCount ="5"; // 페이지 개수 변경은 여기서~~~
        String start = "";
        String pageNum = "";
        String totcnt = "";

        if(httpServletRequest.getParameter("pageNum") != null && !httpServletRequest.getParameter("pageNum").equals("")){
            pageNum = httpServletRequest.getParameter("pageNum");
            start = String.valueOf((Integer.parseInt(pageNum)-1) * Integer.parseInt(pagePerCount));
        }else{
            pageNum = "1";
            start = "0";
        }

        dataMap.put("start", start);
        dataMap.put("pagePerCount", pagePerCount);

        // 검색 o
        if(httpServletRequest.getParameter("search") != null) {
            dataMap.put("search", httpServletRequest.getParameter("search"));
            dataMap.put("search_start", httpServletRequest.getParameter("search_start"));
            dataMap.put("search_end", httpServletRequest.getParameter("search_end"));

            mv.addObject("search", httpServletRequest.getParameter("search"));
            mv.addObject("search_start", httpServletRequest.getParameter("search_start"));
            mv.addObject("search_end", httpServletRequest.getParameter("search_end"));
        }else{
            mv.addObject("search", null);
        }
        list = shService.selectProductWithPaging(dataMap);
        totcnt = String.valueOf(shService.selectProductTotcnt(dataMap).get("totcnt"));


        int pageNums = 0;
        if(Integer.parseInt(totcnt) % Integer.parseInt(pagePerCount) == 0){
            pageNums = Integer.parseInt(totcnt) / Integer.parseInt(pagePerCount);
        }else{
            pageNums = Integer.parseInt(totcnt) / Integer.parseInt(pagePerCount) + 1;
        }
        mv.addObject("pageNums", pageNums);
        mv.addObject("pageNum", pageNum);

        mv.addObject("totcnt", totcnt);
        mv.addObject("list", list);
        return mv;
    }

    @RequestMapping(value = "/product_del_ok")
    public ModelAndView product_del_ok(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("product_del_ok");
        String[] list = httpServletRequest.getParameterValues("ids_chk");

        if(list != null) {
            shService.deleteProduct(list);
            mv.addObject("result", 1);
        }else{
            mv.addObject("result", 0);
        }
        return mv;
    }
    @RequestMapping(value = "/item")
    public ModelAndView item(HttpServletRequest httpServletRequest) throws Exception {


        int up_idx =Integer.parseInt(httpServletRequest.getParameter("up_idx"));
        ModelAndView mv = new ModelAndView("item");
        List<mainDTO> review_list = testService.review(up_idx);
        List<mainDTO> list = testService.itemview(up_idx);
        String up_size []=new String[6];
        String up_color []=new String[6];
        up_size=list.get(0).getUp_size().split(" ");
        up_color=list.get(0).getUp_color().split(" ");
        mv.addObject("up_color",up_color);
        mv.addObject("up_size",up_size);
        mv.addObject("list",list);
        mv.addObject("review_list",review_list);



        return mv;
    }
    @RequestMapping(value = "/review_item_ok")

    public ModelAndView review(HttpServletRequest httpServletRequest) throws Exception {

        int up_idx =Integer.parseInt(httpServletRequest.getParameter("idx"));
        ModelAndView mv = new ModelAndView("review_item_ok");

        HashMap<String, String> dataMap = new HashMap<String, String>();

        try {
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) httpServletRequest;
            Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
            MultipartFile multipartFile = null;
            while (iterator.hasNext()) {
                multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            }

            String filepath = "";
            String filename = "";
            List<Map<String, Object>> filelist = reviewFile.parseInsertFileInfo(httpServletRequest);
            for (int i = 0; i < filelist.size(); i++) {
                filepath = String.valueOf(filelist.get(i).get("File_Path"));
                filename = String.valueOf(filelist.get(i).get("Original_File_Name"));
            }
            dataMap.put("re_image", filepath);
            HttpSession session = httpServletRequest.getSession();
            String id =(String)session.getAttribute("loginId");


            dataMap.put("re_userid", id);
            dataMap.put("re_name", "");
            dataMap.put("re_content", httpServletRequest.getParameter("re_content"));
            dataMap.put("re_itemidx", httpServletRequest.getParameter("idx"));

            //System.out.println(filepath);
            int a = testService.rejoin(dataMap);

            mv.addObject("result",a);
        } catch (ClassCastException e) {
            System.out.println("파일 첨부 안함");
        }


        mv.addObject("idx",up_idx);
        return mv;

    }
    // 정후정후
    @RequestMapping(value = "/item_search")
    public ModelAndView best(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("item_search");
        HashMap<String, String> dataMap = new HashMap<String, String>();
        String search = null;
        if(httpServletRequest.getParameter("search") != null){
            search = httpServletRequest.getParameter("search");
        }
        dataMap.put("search", search);
        List<mainDTO> list =testService.selectItemAllsh(dataMap);
        mv.addObject("search", search);
        mv.addObject("list", list);

        return mv;
    }
    // 소히

    @Autowired
    ShService shService;

    @RequestMapping(value = "/admin_member")
    public ModelAndView admin_member(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("admin_member");
        HashMap<String, String> dataMap = new HashMap<String, String>();
        List<MemberShDTO> list = null;

        // 페이징 세팅
        String pagePerCount ="5"; // 페이지 개수 변경은 여기서~~~
        String start = "";
        String pageNum = "";
        String totcnt = "";

        if(httpServletRequest.getParameter("pageNum") != null && !httpServletRequest.getParameter("pageNum").equals("")){
            pageNum = httpServletRequest.getParameter("pageNum");
            start = String.valueOf((Integer.parseInt(pageNum)-1) * Integer.parseInt(pagePerCount));
        }else{
            pageNum = "1";
            start = "0";
        }

        dataMap.put("start", start);
        dataMap.put("pagePerCount", pagePerCount);

        // 검색 o
        if(httpServletRequest.getParameter("search") != null) {
            dataMap.put("search", httpServletRequest.getParameter("search"));
            dataMap.put("search_start", httpServletRequest.getParameter("search_start"));
            dataMap.put("search_end", httpServletRequest.getParameter("search_end"));

            mv.addObject("search", httpServletRequest.getParameter("search"));
            mv.addObject("search_start", httpServletRequest.getParameter("search_start"));
            mv.addObject("search_end", httpServletRequest.getParameter("search_end"));
        }else{
            mv.addObject("search", null);
        }
        list = shService.selectMemberWithPaging(dataMap);
        totcnt = String.valueOf(shService.selectMemberTotcnt(dataMap).get("totcnt"));


        int pageNums = 0;
        if(Integer.parseInt(totcnt) % Integer.parseInt(pagePerCount) == 0){
            pageNums = Integer.parseInt(totcnt) / Integer.parseInt(pagePerCount);
        }else{
            pageNums = Integer.parseInt(totcnt) / Integer.parseInt(pagePerCount) + 1;
        }
        mv.addObject("pageNums", pageNums);
        mv.addObject("pageNum", pageNum);

        mv.addObject("totcnt", totcnt);
        mv.addObject("list", list);
        return mv;
    }

//    @RequestMapping(value = "/member_search")
//    public ModelAndView member_search(HttpServletRequest httpServletRequest) throws Exception {
//        ModelAndView mv = new ModelAndView("admin_member");
//        HashMap<String, String> dataMap = new HashMap<String, String>();
//
//
//
//        mv.addObject("list", list);
//        return mv;
//    }

    @RequestMapping(value = "/member_del_ok")
    public ModelAndView member_del_ok(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("member_del_ok");
        String[] list = httpServletRequest.getParameterValues("ids_chk");

        //mv.addObject("abclist", list);

        if(list != null) {
            shService.deleteMember(list);
            mv.addObject("result", 1);
        }else{
            mv.addObject("result", 0);
        }
        return mv;
    }

    //하량씨
    @Autowired
    BoardService boardService;

    @Autowired
    ReplyService replyService;

    @RequestMapping("/list")
    public ModelAndView boardList(HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("mypage_1v1list");

        // db notice공지 select
        List<BoardDTO> notice = boardService.boardNotice();
        // db 게시글 total 갯수
        HttpSession httpSession = request.getSession();
        String loginId = "" + httpSession.getAttribute("loginId");

        if(!loginId.equals("admin_juston")) {
            String totalCount = String.valueOf(boardService.boardTotalCount(loginId));
            mv.addObject("notice", notice);
            mv.addObject("totalCount", totalCount);

            // 페이징 처리
            String pagePerCnt = "5"; // 한페이지에 나열할 갯수
            String start = ""; // 몇번쨰 글부터 가져올건지 확인하는 것
            String pageNum = request.getParameter("pageNum"); // 페이지번호
            String totcnt = ""; // 토탈 갯수

            // list 페이지 접속할떄는 아무런 값이 전달되지 않아 null 이므로 pageNum = 1 첫번째 page 로 부여해줌
            if (pageNum != null && !pageNum.equals("")) {
                start = String.valueOf((Integer.parseInt(pageNum) - 1) * Integer.parseInt(pagePerCnt)); // 페이지 번호를 누를때 보이는 db 게시글
            } else {
                pageNum = "1";
                start = "0";
            }
            // db 게시판 글 리스트 select
            HashMap<String, String> map = new HashMap<>();
            map.put("userid", loginId);
            map.put("start", start);
            map.put("pagePerCnt", pagePerCnt);
            List<BoardTotCntDTO> list = boardService.boardList(map);

            int pageNums = 0;
            if (Integer.parseInt(totalCount) % Integer.parseInt(pagePerCnt) == 0) {
                pageNums = Integer.parseInt(totalCount) / Integer.parseInt(pagePerCnt);
            } else {
                pageNums = Integer.parseInt(totalCount) / Integer.parseInt(pagePerCnt) + 1;
            }
            mv.addObject("pageNums", pageNums);
            mv.addObject("list", list);
        }else{
            String totalCount = String.valueOf(boardService.boardTotalCountADMIN());
            mv.addObject("notice", notice);
            mv.addObject("totalCount", totalCount);

            // 페이징 처리
            String pagePerCnt = "5"; // 한페이지에 나열할 갯수
            String start = ""; // 몇번쨰 글부터 가져올건지 확인하는 것
            String pageNum = request.getParameter("pageNum"); // 페이지번호
            String totcnt = ""; // 토탈 갯수

            // list 페이지 접속할떄는 아무런 값이 전달되지 않아 null 이므로 pageNum = 1 첫번째 page 로 부여해줌
            if (pageNum != null && !pageNum.equals("")) {
                start = String.valueOf((Integer.parseInt(pageNum) - 1) * Integer.parseInt(pagePerCnt)); // 페이지 번호를 누를때 보이는 db 게시글
            } else {
                pageNum = "1";
                start = "0";
            }
            // db 게시판 글 리스트 select
            HashMap<String, String> map = new HashMap<>();
            map.put("start", start);
            map.put("pagePerCnt", pagePerCnt);
            List<BoardTotCntDTO> list = boardService.boardListADMIN(map);

            int pageNums = 0;
            if (Integer.parseInt(totalCount) % Integer.parseInt(pagePerCnt) == 0) {
                pageNums = Integer.parseInt(totalCount) / Integer.parseInt(pagePerCnt);
            } else {
                pageNums = Integer.parseInt(totalCount) / Integer.parseInt(pagePerCnt) + 1;
            }
            mv.addObject("pageNums", pageNums);
            mv.addObject("list", list);
        }


        return mv;
    }

    @Autowired
    MemberService memberService;
    @RequestMapping("/write")
    public ModelAndView boardWrite(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("mypage_1v1write");
        HttpSession httpSession = request.getSession();
        String loginId = "" + httpSession.getAttribute("loginId");
//        String loginId = "dlwlsdudslae";

        // MemberDTO로 넣어주기 //xml의 ParameterType에 맞춰준다.
        List<SetMemberInfo> setMemberInfos = memberService.viewModify(loginId);
        mv.addObject("loginInfos", setMemberInfos);

        return mv;
    }

    @Resource(name="fileUtils")
    private FileService fileService;

    @RequestMapping("/watch")
    public ModelAndView boardWatch(HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("mypage_1v1watch");
// write -> watch로 이동하여 게시판 글 db 등록
        String category = request.getParameter("personal_type");
        if (category != null) {
            String email = request.getParameter("email");
            String hp = request.getParameter("etcphone");
            String title = request.getParameter("title");
            String contents = request.getParameter("contents");
            HttpSession session = request.getSession();
            String userid = (String)session.getAttribute("loginId");

            HashMap<String, String> map = new HashMap<>();
            map.put("userid", userid);
            map.put("category", category);
            map.put("email", email);
            map.put("hp", hp);
            map.put("title", title);
            map.put("contents", contents);
            map.put("filepath", null);
            map.put("filename", null);
            boardService.inputBoard(map);
        }
// watch 게시판 idx 로 게시글 select
        String idx = request.getParameter("idx");
        if (idx != null) {
            BoardWatchDTO boardWatch = boardService.boardWatch(Integer.parseInt(idx));
            mv.addObject("result", boardWatch);
            String replyWatch = replyService.replyWatch(Integer.parseInt(idx));
            mv.addObject("replyWatch", replyWatch);
        }
        String replyContent = request.getParameter("re_content");
        if(replyContent != null) {
            String inputReIdx = request.getParameter("inputReIdx");
            HashMap<String, String> map = new HashMap<>();
            map.put("articleNo", inputReIdx);
            map.put("reContent", replyContent);
            int reContent = replyService.inputReply(map);
            mv.addObject("reContent", reContent);
            replyService.replyAnswer(Integer.parseInt(inputReIdx));
        }
        mv.addObject("idx", idx);

        HttpSession session = request.getSession();
        String admin = (String)session.getAttribute("loginId");
        mv.addObject("admin", admin);


        //        try {
//            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
//            Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
//            MultipartFile multipartFile = null;
//            while(iterator.hasNext()){
//                multipartFile = multipartHttpServletRequest.getFile(iterator.next());
//            }
//            //        fileService.parseInsertFileInfo(multipartFile, request); // 파라미터 보내기
//            String filepath = "";
//            String filename = "";
//            List<Map<String, Object>> filelist = fileService.parseInsertFileInfo(request);
//            for (int i=0; i<filelist.size(); i++){
//                filepath = String.valueOf(filelist.get(i).get("File_Path"));
//                filename = String.valueOf(filelist.get(i).get("Original_File_Name"));
//            }
//            String category = request.getParameter("personal_type");
//            String email = request.getParameter("email");
//            String hp = request.getParameter("etcphone");
//            String title = request.getParameter("title");
//            String contents = request.getParameter("contents");
//
//            HashMap<String, String> map = new HashMap<>();
//            map.put("category", category);
//            map.put("email", email);
//            map.put("hp", hp);
//            map.put("title", title);
//            map.put("contents", contents);
//            map.put("filepath", filepath);
//            map.put("filename", filename);
//            boardService.inputBoard(map);
//        } catch (ClassCastException e) {
//            System.out.println("파일 첨부 안함");
        return mv;
    }

    @RequestMapping("/notice")
    public ModelAndView boardNotice(HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("mypage_1v1notice");

        String title = request.getParameter("title");
        String contents = boardService.boardText(title);
        mv.addObject("title", title);
        mv.addObject("contents", contents);
        return mv;
    }





    //준호씨
//    @RequestMapping(value = "/test")
//    public ModelAndView test() throws Exception {
////        mv에 test.jsp 파일을 세팅해주고, url은 localhost:8080/test로 함
//        ModelAndView mv = new ModelAndView("test");
//        List<TestDTO> list = testService.selectTest();
////        jsp파일에서 mv를 list라는 이름으로 사용하며, 그 값은 list
//        mv.addObject("listNAME", list);
//        return mv;
//    }

//    @RequestMapping(value = "/item")
//    public ModelAndView item() throws Exception {
//        ModelAndView mv = new ModelAndView("item");
//        List<TestDTO> list = testService.selectTest();
//        mv.addObject("list", list);
//        return mv;
//    }

//    @RequestMapping(value = "/item2")
//    public ModelAndView item2(HttpServletRequest httpServletRequest) throws Exception {
//
//        int up_idx =Integer.parseInt(httpServletRequest.getParameter("up_idx"));
//        ModelAndView mv = new ModelAndView("item2");
////        List<mainDTO> review = testService.review(up_idx);
//        List<mainDTO> list = testService.itemview(up_idx);
//        String up_size []=new String[6];
//        String up_color []=new String[6];
//        up_size=list.get(0).getUp_size().split(" ");
//        up_color=list.get(0).getUp_color().split(" ");
//        mv.addObject("up_color",up_color);
//        mv.addObject("up_size",up_size);
//        mv.addObject("list",list);
////        mv.addObject("review",review);
//
//
//        return mv;
//    }


    @RequestMapping(value = "/cart")
    public ModelAndView cart(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("cart");
        HttpSession session = httpServletRequest.getSession(true);
        String sessionUserid = (String) session.getAttribute("loginId");
        System.out.println(sessionUserid);
        List<CartDTO> cartList = testService.cartshow1(sessionUserid);
        for(int i=0; i<cartList.size(); i++){
            System.out.println(cartList.get(i).getCart_productimg());
        }
        mv.addObject("cartList", cartList);
        return mv;
    }

    @RequestMapping(value = "item_ok")
    public ModelAndView start(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("item_ok");
        HashMap<String, String> dataMap = new HashMap<String, String>();
        String productName = httpServletRequest.getParameter("productName");
        String productSize = httpServletRequest.getParameter("productSize");
        String productColor = httpServletRequest.getParameter("productColor");
        String productAmount = httpServletRequest.getParameter("amount");
        String productPrice = httpServletRequest.getParameter("productPrice");
        String productImage = httpServletRequest.getParameter("productImage");

        dataMap.put("cart_amount", productAmount);
        dataMap.put("cart_productprice", productPrice);
        dataMap.put("cart_productname", productName);
        dataMap.put("cart_color", productColor);
        dataMap.put("cart_size", productSize);
        dataMap.put("cart_productimg", productImage);


        HttpSession session = httpServletRequest.getSession(true);
        String sessionUserid = (String) session.getAttribute("loginId");
        dataMap.put("cart_userid", sessionUserid);

        List<CartDTO> cartList = testService.cartshow1(sessionUserid);
        int check = 0;
        for (int i = 0; i < cartList.size(); i++) {
            if ((cartList.get(i).getCart_productname().equals(productName)) && (cartList.get(i).getCart_size().equals(productSize)) && (cartList.get(i).getCart_color().equals(productColor))) {
                check++;
            }
        }
        //그리고 datamap을 db에 넣어주기
        if ((sessionUserid != null) && check == 0) {
            int a = testService.join(dataMap);
            mv.addObject("result", a);
            //userid값이 있으면, db에 넣어주기
        } else if (check > 0) {
            mv.addObject("result", -1);
        } else {
            mv.addObject("result", 0);
        }
        return mv;
    }

    @RequestMapping(value = "cart_delete")
    public ModelAndView delete(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("cart_delete");
        System.out.println("cart_delete실행완료");
        String[] productidx = httpServletRequest.getParameterValues("checkbox");
        List result = new ArrayList();
        int a = 0;
        int idx = 0;
        for (int i = 0; i < productidx.length; i++) {
            HashMap<String, Object> dataMap = new HashMap<String, Object>();
            idx = Integer.parseInt(productidx[i]);
            a = testService.deleteItem(idx);
            result.add(a);
        }
        mv.addObject("result", result);
        return mv;
    }
    @RequestMapping(value = "cart_reset")
    public ModelAndView reset(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("cart_reset");
        String[] productidx = httpServletRequest.getParameterValues("productidx");
        List result = new ArrayList();
        int a = 0;
        int idx = 0;
        for (int i = 0; i < productidx.length; i++) {
            idx = Integer.parseInt(productidx[i]);
            a = testService.deleteItem(idx);
            result.add(a);
        }
        mv.addObject("result", result);
        return mv;
    }


    @RequestMapping(value = "cart_update")
    public ModelAndView update(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView("cart_update");
        HttpSession session = httpServletRequest.getSession(true);
        String sessionUserid = (String) session.getAttribute("loginId");
        //System.out.println("cartupdate실행완료");
        String[] productName = httpServletRequest.getParameterValues("productName");
        String[] productAmount = httpServletRequest.getParameterValues("productAmount");
        String[] productSize = httpServletRequest.getParameterValues("productSize");
        List result = new ArrayList();
        int a = 0;
        for (int i = 0; i < productName.length; i++) {
            HashMap<String, Object> dataMap = new HashMap<String, Object>();
            dataMap.put("cart_userid", sessionUserid);
            dataMap.put("cart_productname", productName[i]);
            dataMap.put("cart_amount", Integer.parseInt(productAmount[i]));
            dataMap.put("cart_size", productSize[i]);
            a = testService.cartUpdate(dataMap);
            result.add(a);
            //System.out.println(Integer.parseInt(productAmount[i]));
            //System.out.println(a);
        }
        mv.addObject("result", result);
        return mv;
    }
}


