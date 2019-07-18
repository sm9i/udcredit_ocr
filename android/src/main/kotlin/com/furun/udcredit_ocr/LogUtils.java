package com.furun.udcredit_ocr;

import android.util.Log;

/**
 * 统一管理log
 */
public class LogUtils {

    public static String TAG = "LogUtils=========>";

    public static boolean DEBUG = true;

    public static void DEBUG(boolean open) {
        DEBUG = open;
    }

    public static void loge(String msg) {
        if (DEBUG)
            Log.e(TAG, msg);
    }

    public static void loge(String tag, String msg) {
        if (DEBUG)
            Log.e(tag, msg);
    }

    public static void logi(String msg) {
        if (DEBUG)
            Log.i(TAG, msg);
    }

    public static void logd(String msg) {
        if (DEBUG)
            Log.d(TAG, msg);
    }

    public static void logv(String msg) {
        if (DEBUG)
            Log.v(TAG, msg);
    }

    /**
     * 日志打印不全
     */

    public static void e_All(String msg){
        int length = msg.length();
        if(msg.length() > 4000) {
            for(int i=0;i<msg.length();i+=4000){
                if(i+4000<msg.length())
                    loge("dianshang"+i,msg.substring(i, i+4000));
                else
                    loge("dianshang"+i,msg.substring(i, length));
            }
        } else
           loge("dianshang",msg);
    }
}
