package mdhash;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class mdjavahash {
	private String hashpass="";

    public String getHashPass(String password) throws 
        NoSuchAlgorithmException{

        String plainText = password;
        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
        mdAlgorithm.update(plainText.getBytes());

        byte[] digest = mdAlgorithm.digest();
        StringBuffer hexString = new StringBuffer();

        for (int i = 0; i < digest.length; i++) {
            plainText = Integer.toHexString(0xFF & digest[i]);

            if (plainText.length() < 2) {
                plainText = "0" + plainText;
            }

            hexString.append(plainText);
        }
        hashpass = hexString.toString();

        return hashpass;
    }
}
//<%
//if(product.getCategoryID()==1||product.getCategoryID()==12){%>
//<a>Thương hiệu:BlackBerry</a>
//<a>Model:	Keyone</a>
//<a>Phụ kiện đi kèm:	1 Pin dự phòng</a>
//<a>Màu:	Đen Viền Bạc</a>
//<a>Loại màn hình (Công nghệ màn hình):	IPS LCD</a>
//<a>Kích thước màn hình: 4.5 inch</a>
//<a>Độ phân giải màn hình:	1620 x 1080 pixels</a>
//<a>Camera trước:	8MP</a>
//<a>Camera sau:	12 MP</a>
//<a>Đèn Flash:	Có</a>
//<a>Quay phim:	1080p@30fps</a>
//<a>Bộ Nhớ RAM:	3GB</a>
//<a>Bộ nhớ trong (ROM):	32GB</a>
//<a>Hỗ trợ thẻ nhớ ngoài:	microSD</a>
//<a>Hỗ trợ thẻ tối đa:	256GB</a>
//<a>Kích thước:	(Dài x Rộng x Dày) 149.1 x 72.4 x 9.4 mm</a>
//<a>Tên chip:	Qualcomm MSM8953 Snapdragon 625</a>
//<a>Tốc độ chip (GHz):	2.0 GHz</a>
//<a>Chip đồ họa (GPU):	Adreno 506</a>
//<a>Hệ điều hành:	Android 7.1 Nougat</a>
//<a>Dung lượng pin (mAh):	3505mAh</a>
//<a>Loại pin:	Li-Ion</a>
//<a>Pin có thể tháo rời:	Không</a>
//<a>Loại Sim:	Nano-SIM</a>
//<a>Số khe sim:	1</a>
//<a>FM radio:	Không</a>
//<a>SKU:5807246169547</a>
//	<%	
//	}else{
//%>
//<a>Sản phẩm được phân phối theo nhà sản xuất</a>
//<a>Bảo hành đến 36 tháng </a>
//<%} %>