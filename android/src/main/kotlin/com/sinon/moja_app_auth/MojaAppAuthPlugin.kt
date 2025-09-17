package com.yourcompany.moja_app_auth

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MojaAppAuthPlugin: FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel : MethodChannel
    private lateinit var context : Context

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "moja_app_auth")
        channel.setMethodCallHandler(this)
        context = binding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "isMojaAppInstalled" -> {
                val pm: PackageManager = context.packageManager
                try {
                    pm.getPackageInfo("com.sinon.app.moja_app", 0) // ← MojaApp package name
                    result.success(true)
                } catch (e: Exception) {
                    result.success(false)
                }
            }
            "loginWithMojaApp" -> {
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse("moja://login"))
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                context.startActivity(intent)
                result.success("OTP/TOKEN placeholder from Android")
            }
            "redirectToStore" -> {
                val intent = Intent(Intent.ACTION_VIEW,
                    Uri.parse("market://details?id=com.sinon.app.moja_app"))
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                context.startActivity(intent)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
