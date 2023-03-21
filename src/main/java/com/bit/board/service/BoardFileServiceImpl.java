package com.bit.board.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Service
public class BoardFileServiceImpl implements BoardFileService {

    @Override
    public String getMessage(HttpServletRequest request, String msg, String url) {
        String message = null;
        String path = request.getContextPath();
        message = "<script>alert('" + msg + "');";
        message += "location.href='" + path + url + "';</script>";
        return message;
    }

    @Override
    public String saveFile(MultipartFile file) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss-");
        Calendar calendar = Calendar.getInstance();

        String sysFileName = sdf.format(calendar.getTime());
        sysFileName += file.getOriginalFilename();

        File saveFile = new File(IMAGE_REPO + "/" + sysFileName);
        try {
            file.transferTo(saveFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sysFileName;
    }

    @Override
    public void deleteImage(String originFileName) {
        File file = new File(IMAGE_REPO + "/" + originFileName);
        file.delete();
    }


}
