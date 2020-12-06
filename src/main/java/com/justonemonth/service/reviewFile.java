package com.justonemonth.service;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;
@Component("filereview")
public class reviewFile {




        String filePathsh = "C:/justonemonth/justone/justonemonth22.1216수정/src/main/resources/static/images/review/";
        public List<Map<String, Object>> parseInsertFileInfo(HttpServletRequest request) throws Exception {
            MultipartHttpServletRequest mulReq = (MultipartHttpServletRequest) request;
            String original_Name = null;
            MultipartFile mulFile = null;
            Iterator<String> iterator = mulReq.getFileNames();

            List<Map<String, Object>> fileList = new ArrayList();
            Map<String, Object> fileMap = null;

            File file = new File(filePathsh);
            if (file.exists() == false) {
                file.mkdir();
            }
            while (iterator.hasNext()) {
                mulFile = mulReq.getFile(iterator.next());

                if (mulFile.isEmpty() == false) {
                    original_Name = mulFile.getOriginalFilename();

                    file = new File(filePathsh + original_Name);
                    mulFile.transferTo(file); // transferTo 저장

                    fileMap = new HashMap<String, Object>();

                    fileMap.put("Original_File_Name", original_Name);
                    fileMap.put("File_Size", mulFile.getSize());
                    fileMap.put("File_Path", "./images/review/" + original_Name);
                    fileList.add(fileMap);
                }
            }
            return fileList;
        }


}
