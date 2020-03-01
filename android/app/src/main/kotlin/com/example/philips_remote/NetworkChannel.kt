package com.example.philips_remote

import android.content.Context
import android.content.SharedPreferences
import android.os.Handler
import android.os.Looper
import com.burgstaller.okhttp.AuthenticationCacheInterceptor
import com.burgstaller.okhttp.CachingAuthenticatorDecorator
import com.burgstaller.okhttp.digest.CachingAuthenticator
import com.burgstaller.okhttp.digest.Credentials
import com.burgstaller.okhttp.digest.DigestAuthenticator
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import okhttp3.*
import okhttp3.RequestBody.Companion.toRequestBody
import okio.IOException
import java.security.SecureRandom
import java.security.cert.X509Certificate
import java.util.concurrent.ConcurrentHashMap
import javax.net.ssl.HostnameVerifier
import javax.net.ssl.SSLContext
import javax.net.ssl.TrustManager
import javax.net.ssl.X509TrustManager


class NetworkChannel(binaryMessenger: BinaryMessenger, context: Context) {
    private val CHANNEL_NAME = "izerik.dev/network"
    private val SHARED_PREFERENCES_NAME = "FlutterSharedPreferences"
    private val sharedPref: SharedPreferences
    private var client: OkHttpClient

    init {
        this.sharedPref = context.getSharedPreferences(SHARED_PREFERENCES_NAME, Context.MODE_PRIVATE)
        this.client = OkHttpClient.Builder().apply {
            ignoreAllSSLErrors()
        }.build()

        MethodChannel(binaryMessenger, CHANNEL_NAME).setMethodCallHandler { call, result ->

            val callMethod = call.method

            if (call.method == "get" || call.method == "post" || call.method == "getImage") {
                val method = call.method

                val payload = call.arguments as Map<String, Any>

                val url = payload["url"] as String

                var request: Request = Request.Builder().url(url).get().build()

                if (method == "post") {
                    val body = payload["body"]
                    if (body is String) {
                        var postBody: RequestBody = body.toRequestBody()
                        request = request.newBuilder().post(postBody).build()
                    }
                }

                val user = sharedPref.getString("flutter.user", null)
                val pass = sharedPref.getString("flutter.pass", null)

                if (user != null && pass != null) {
                    val credentials = Credentials(user, pass)
                    val authenticator = DigestAuthenticator(credentials)
                    val authCache: Map<String, CachingAuthenticator> = ConcurrentHashMap()

                    client = this.client.newBuilder()
                            .authenticator(CachingAuthenticatorDecorator(authenticator, authCache))
                            .addInterceptor(AuthenticationCacheInterceptor(authCache))
                            .build()
                }

                client.newCall(request).enqueue(object : Callback {
                    override fun onFailure(call: Call, e: IOException) {
                        val payload = mapOf<String, Any>("status" to "failure", "error" to e.localizedMessage)

                        Handler(Looper.getMainLooper()).post {
                            result.success(payload)
                        }
                    }

                    override fun onResponse(call: Call, response: Response) {
                        response.use {
                            if (!response.isSuccessful) throw IOException("Unexpected code $response")

                            for ((name, value) in response.headers) {
                                println("$name: $value")
                            }

                            var payloadResult: Any? = null

                            payloadResult = if (callMethod == "getImage") {
                                response.body!!.bytes()
                            } else {
                                response.body!!.string()
                            }

                            val payload = mapOf<String, Any>("status" to "success", "result" to payloadResult!!)

                            Handler(Looper.getMainLooper()).post {
                                result.success(payload)
                            }
                        }
                    }
                })
            } else {
                result.notImplemented()
            }
        }
    }

    private fun OkHttpClient.Builder.ignoreAllSSLErrors(): OkHttpClient.Builder {
        val naiveTrustManager = object : X509TrustManager {
            override fun getAcceptedIssuers(): Array<X509Certificate> = arrayOf()
            override fun checkClientTrusted(certs: Array<X509Certificate>, authType: String) = Unit
            override fun checkServerTrusted(certs: Array<X509Certificate>, authType: String) = Unit
        }

        val insecureSocketFactory = SSLContext.getInstance("TLSv1.2").apply {
            val trustAllCerts = arrayOf<TrustManager>(naiveTrustManager)
            init(null, trustAllCerts, SecureRandom())
        }.socketFactory

        sslSocketFactory(insecureSocketFactory, naiveTrustManager)
        hostnameVerifier(HostnameVerifier { _, _ -> true })
        return this
    }
}
