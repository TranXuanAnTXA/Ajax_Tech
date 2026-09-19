package com.baitap.graphql.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.baitap.graphql.service.FileUploadService;

@RestController
@RequestMapping("/api/upload")
public class FileUploadController {

    private final FileUploadService fileUploadService;

    public FileUploadController(FileUploadService fileUploadService) {
        this.fileUploadService = fileUploadService;
    }

    // Upload ảnh Category
    @PostMapping("/category")
    public ResponseEntity<Map<String, Object>> uploadCategoryImage(
            @RequestParam("file") MultipartFile file) {

        return uploadFile(file);
    }

    // Upload ảnh Product
    @PostMapping("/product")
    public ResponseEntity<Map<String, Object>> uploadProductImage(
            @RequestParam("file") MultipartFile file) {

        return uploadFile(file);
    }

    // Hàm dùng chung cho Category và Product
    private ResponseEntity<Map<String, Object>> uploadFile(
            MultipartFile file) {

        Map<String, Object> response = new HashMap<>();

        try {

            if (file == null || file.isEmpty()) {

                response.put("success", false);
                response.put(
                        "message",
                        "Vui lòng chọn ảnh"
                );

                return ResponseEntity
                        .badRequest()
                        .body(response);
            }

            String imageUrl =
                    fileUploadService.upload(file);

            response.put(
                    "success",
                    true
            );

            response.put(
                    "message",
                    "Upload ảnh thành công"
            );

            response.put(
                    "imageUrl",
                    imageUrl
            );

            return ResponseEntity
                    .ok(response);

        } catch (IOException e) {

            e.printStackTrace();

            response.put(
                    "success",
                    false
            );

            response.put(
                    "message",
                    "Upload ảnh thất bại"
            );

            return ResponseEntity
                    .internalServerError()
                    .body(response);
        }
    }
}