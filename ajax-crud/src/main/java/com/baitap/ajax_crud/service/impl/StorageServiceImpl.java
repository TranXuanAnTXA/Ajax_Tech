package com.baitap.ajax_crud.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baitap.ajax_crud.service.StorageService;

@Service
public class StorageServiceImpl implements StorageService {

    private final Path uploadPath =
            Paths.get("src/main/resources/static/uploads");

    @Override
    public String store(MultipartFile file) {

        if (file == null || file.isEmpty()) {
            return null;
        }

        try {

            // Tạo thư mục uploads nếu chưa tồn tại
            Files.createDirectories(uploadPath);

            // Lấy tên file gốc
            String originalFileName =
                    file.getOriginalFilename();

            // Lấy phần mở rộng của file
            String extension = "";

            if (originalFileName != null
                    && originalFileName.contains(".")) {

                extension = originalFileName.substring(
                        originalFileName.lastIndexOf(".")
                );
            }

            // Tạo tên file mới để tránh trùng tên
            String fileName =
                    UUID.randomUUID().toString()
                    + extension;

            // Đường dẫn file cần lưu
            Path destination =
                    uploadPath.resolve(fileName);

            // Lưu file
            Files.copy(
                    file.getInputStream(),
                    destination,
                    StandardCopyOption.REPLACE_EXISTING
            );

            // Trả về tên file
            return fileName;

        } catch (IOException e) {

            throw new RuntimeException(
                    "Không thể lưu file: "
                    + e.getMessage(),
                    e
            );
        }
    }
}