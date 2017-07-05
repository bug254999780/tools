package apec.controller;

import apec.util.Encode;
import com.google.zxing.Result;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/3.
 */
@RestController
public class AnalysisController {
    org.slf4j.Logger logger = LoggerFactory.getLogger(AnalysisController.class);

    @RequestMapping(value = "qrcode", method = RequestMethod.GET)
    public void QRCode(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "content", required = true) String content) {

        response.setContentType("image/png");
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        byte[] bytes = Encode.toEncode(content, Encode.ImgType.PNG);
        try (OutputStream out = response.getOutputStream()) {
            out.write(bytes);
            out.flush();
        } catch (Exception e) {
            logger.error("qrcode error content:{}", content);
        }
    }

    @RequestMapping(value = "aacode")
    public void DQRCode(HttpServletRequest request, HttpServletResponse response)throws Exception {
        response.setCharacterEncoding("utf-8");
        ServletInputStream servletInputStream=request.getInputStream();
        MultipartHttpServletRequest multipartHttpServletRequest=(MultipartHttpServletRequest)request;
        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        MultipartFile file= multipartHttpServletRequest.getFile("files[]");
        // 获得输入流：
        InputStream input = file.getInputStream();
        Result result= Encode.dEncode(input);
        try (PrintWriter pw = response.getWriter()) {
            pw.print(result==null?"null":result.getText());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
