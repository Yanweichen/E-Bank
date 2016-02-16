package com.bank.utils;
import com.alibaba.fastjson.JSONObject;
import com.qcloud.*;
import java.io.*;

import org.apache.commons.codec.binary.Base64;

public class QclodImageUtil {
	// appid, access id, access key请去http://app.qcloud.com申请使用
	// 下面的的demo代码请使用自己的appid
	public static final int APP_ID_V1 = 10021396;
	public static final String SECRET_ID_V1 = "AKID2Chwh9v84gKjOqxNCWfBJ5lckTfaolAD";
	public static final String SECRET_KEY_V1 = "4XkQY7qybM7wPHywaxHdVXM8HNfyMMmi";
        
    public static final int APP_ID_V2 = 10021396;
	public static final String SECRET_ID_V2 = "AKID2Chwh9v84gKjOqxNCWfBJ5lckTfaolAD";
	public static final String SECRET_KEY_V2 = "4XkQY7qybM7wPHywaxHdVXM8HNfyMMmi";
    public static final String BUCKET = "sourceimg";        //空间名
        
    //public static final String TEST_URL = "http://b.hiphotos.baidu.com/image/pic/item/8ad4b31c8701a18b1efd50a89a2f07082938fec7.jpg";

//	public static void main(String[] args) throws Exception {
//            //sign_test();
//            //v1版本api的demo
//            //apiV1Demo("D:/sss.jpg");
//            //v2版本api的demo
//            apiV2Demo("C:/Users/yanwe/Desktop/company_logo.png");
//            //分片上传
//            //sliceUpload("D:/sss.jpg");
//            //黄图识别服务demo
//            pornDemo(TEST_URL);
//	}
    
    public static UploadResult upload(String pic) throws Exception {
        PicCloud pc = new PicCloud(APP_ID_V2, SECRET_ID_V2, SECRET_KEY_V2, BUCKET);
	    ByteArrayInputStream inputStream = new ByteArrayInputStream(Base64.decodeBase64(pic));
	    UploadResult  ret = pc.upload(inputStream);
        return ret;
    }

    public static int delete(String name) throws Exception {
        PicCloud pc = new PicCloud(APP_ID_V2, SECRET_ID_V2, SECRET_KEY_V2, BUCKET);
        int ret = pc.delete(name);
        return ret;
    }
    
	public static UploadResult picBase(PicCloud pc, String pic) throws Exception {
		// 上传一张图片
                //1. 直接指定图片文件名的方式
//		UploadResult result = pc.upload(pic);
//        if(result != null){
//            result.print(); 
//        }
//        //2. 文件流的方式
//        FileInputStream fileStream = new FileInputStream(pic);
//        result = pc.upload(fileStream);
//        if(result != null){
//            result.print(); 
//        }
//              3. 字节流的方式
        ByteArrayInputStream inputStream = new ByteArrayInputStream(Base64.decodeBase64(pic));
        UploadResult  ret = pc.upload(inputStream);
        
		// 查询图片的状态
//		PicInfo info = pc.stat(result.fileId);
//        if(info != null){
//            info.print(); 
//        }
//		// 复制一张图片
//		result = pc.copy(result.fileId);
//		// 删除一张图片
//		int ret = pc.delete(result.fileId);
        return ret;
	}
        
    public static void sliceUpload(String url){
        PicCloud pc = new PicCloud(APP_ID_V2, SECRET_ID_V2, SECRET_KEY_V2, BUCKET);
        SliceUploadInfo info = pc.simpleUploadSlice(url, 128*1024);
        if (info != null) {
            System.out.println("slice upload pic success");
	info.print();
        } else {
	System.out.println("slice upload pic error, error=" + pc.getError());
        }
    }
    
    public static void pornDemo(String url){
        PicCloud pc = new PicCloud(APP_ID_V2, SECRET_ID_V2, SECRET_KEY_V2, BUCKET);
        PornDetectInfo info = pc.pornDetect(url);
        info.print();
    }
        
        /**
         * 获取签名
         * @param type 操作类型
         * @param fileid 唯一标识
         * @return
         */
        public static JSONObject getSignatrue(String type,String fileid){
        	//请将下面的APP_ID_V2，SECRET_ID_V2，SECRET_KEY_V2，BUCKET替换为开发者自己的项目信息
            PicCloud pc = new PicCloud(APP_ID_V2, SECRET_ID_V2, SECRET_KEY_V2, BUCKET);
            String sign = "";
            long expired = System.currentTimeMillis() / 1000 + 3600;
            if(null == type || "".equals(type)){
                    sign = pc.getSign(expired);
            }else if("upload".equals(type)){
                    sign = pc.getSign(expired);
            }else if("copy".equals(type) ||
                            "del".equals(type) ||
                            "download".equals(type) ){
                    sign = pc.getSignOnce(fileid);
            }else{
                    sign = "";
            }

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("ver", "V2");
            jsonObject.put("sign", sign.toString());
            return jsonObject;
        }
}
