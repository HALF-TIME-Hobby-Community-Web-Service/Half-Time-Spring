package com.hf.s3;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

public class S3FileService {

    private AmazonS3 amazonS3;
    
    public S3FileService() {
		super();
	}

	public S3FileService(AmazonS3 amazonS3) {
        this.amazonS3 = amazonS3;
    }

    public void uploadFile(String bucketName, String filename, byte[] content, MultipartFile file) {
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(content.length);
        metadata.setContentType(file.getContentType());
        String key = "moment/" + filename;
        PutObjectRequest request = new PutObjectRequest(bucketName, key, new ByteArrayInputStream(content), metadata);
        request.setMetadata(metadata);
        amazonS3.putObject(request);
    }

    public byte[] downloadFile(String bucketName, String key) {
        S3Object object = amazonS3.getObject(bucketName, key);
        S3ObjectInputStream objectInputStream = object.getObjectContent();

        // 파일 내용을 바이트 배열로 읽음
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len;
        try {
            while ((len = objectInputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return byteArrayOutputStream.toByteArray();
    }
}

