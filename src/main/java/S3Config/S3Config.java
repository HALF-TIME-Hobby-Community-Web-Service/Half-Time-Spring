package S3Config;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class S3Config {

    @Bean
    public AmazonS3 amazonS3Client() {
        // AWS 계정 정보 설정
        BasicAWSCredentials awsCredentials = new BasicAWSCredentials("AKIASS6WBEKJCGYTD5ET", "IuRgMRm4ir8jkoaUBir99mNoOvkO8gh9SkhC9UEz");

        // AWS S3 클라이언트 생성
        return AmazonS3Client.builder()
                .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration("https://s3.ap-northeast-2.amazonaws.com", "ap-northeast-2")) // 엔드포인트 및 리전 설정
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .build();
    }
}
