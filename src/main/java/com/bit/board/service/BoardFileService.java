package com.bit.board.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface BoardFileService {

    public static String IMAGE_REPO = "D:\\Market Project Image";

    public String getMessage(HttpServletRequest request, String msg, String url);

    public String saveFile(MultipartFile file);

    public void deleteImage(String originFileName);
}
