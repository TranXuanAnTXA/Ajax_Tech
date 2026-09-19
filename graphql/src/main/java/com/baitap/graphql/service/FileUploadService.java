package com.baitap.graphql.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

    private final Path uploadDir =
            Paths.get("uploads");

    public FileUploadService() throws IOException {

        if (!Files.exists(uploadDir)) {

            Files.createDirectories(uploadDir);
        }
    }

    public String upload(MultipartFile file)
            throws IOException {

        if (file == null || file.isEmpty()) {

            return null;
        }

        String originalFilename =
                file.getOriginalFilename();

        String extension = "";

        if (originalFilename != null
                && originalFilename.contains(".")) {

            extension =
                    originalFilename.substring(
                            originalFilename.lastIndexOf(".")
                    );
        }

        String filename =
                UUID.randomUUID()
                        + extension;

        Path target =
                uploadDir.resolve(filename);

        Files.copy(
                file.getInputStream(),
                target,
                StandardCopyOption.REPLACE_EXISTING
        );

        return "/uploads/" + filename;
    }
}