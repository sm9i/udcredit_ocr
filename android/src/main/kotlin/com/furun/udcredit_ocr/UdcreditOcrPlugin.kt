package com.furun.udcredit_ocr

import android.app.Activity
import android.util.Log
import com.authreal.api.AuthBuilder
import com.authreal.api.OnResultCallListener
import com.lianlian.face.FaceUtil.init
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class UdcreditOcrPlugin : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "udcredit_ocr")
            channel.setMethodCallHandler(UdcreditOcrPlugin(registrar.activity()))
        }
    }

    var mActivity: Activity

    constructor(mActivity: Activity) {
        this.mActivity = mActivity
    }


    override fun onMethodCall(call: MethodCall, result: Result) {
        when {
            call.method == "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
            call.method == "init" -> {
                init(call, result)
            }
            else -> result.notImplemented()
        }
    }

    private lateinit var authBuilder: AuthBuilder
    private fun init(call: MethodCall, result: Result) {
        Log.i("ANDROID", "init")
        val outOrderId = call.argument<String>("outOrderId") as String
        val authKey = call.argument<String>("authKey") as String
        val urlNotify = call.argument<String>("urlNotify") as String

        Log.i("ANDROID", "kotlin-$outOrderId")
        Log.i("ANDROID", "kotlin-$authKey")
        Log.i("ANDROID", "kotlin-$urlNotify")
        authBuilder = AuthBuilder(outOrderId, authKey, urlNotify,
                OnResultCallListener { str, obj ->
                    obj.put("message", str)
                    LogUtils.e_All("kotlin-AuthBuilder-$str")
                    result.success(obj.toString())
                })
        authBuilder.faceAuth(mActivity)
    }


}
