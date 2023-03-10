package cn.cslg.CSLGAccessReservationSystem.QrCode;

import com.google.zxing.Result;
import com.google.zxing.Binarizer;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.HybridBinarizer;

import java.io.File;
import java.util.Map;
import java.util.HashMap;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;

public class CreateParseCode {
    public static int width = 500;
    public static int height = 500;
    
    public boolean createCode(String text, int width, int height, String path){
        String format = "jpg";
        HashMap hints = new HashMap();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");                      //内容所使用编码
        try {
            BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height, hints);
            File outputFile = new File(path);
            MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String parseCode(File file) {
        try {
            MultiFormatReader formatReader = new MultiFormatReader();
            if (!file.exists()) {
                return null;
            }

            BufferedImage image = ImageIO.read(file);
            LuminanceSource source = new BufferedImageLuminanceSource(image);
            Binarizer binarizer = new HybridBinarizer(source);
            BinaryBitmap binaryBitmap = new BinaryBitmap(binarizer);

            Map hints = new HashMap();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
            Result result = formatReader.decode(binaryBitmap, hints);
            return result.getText();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}