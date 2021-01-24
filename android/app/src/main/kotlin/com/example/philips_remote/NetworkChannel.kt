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
import dev.flutter.pigeon.Pigeon
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import okhttp3.*
import okhttp3.RequestBody.Companion.toRequestBody
import okio.IOException
//import java.io.IOException
import java.security.SecureRandom
import java.security.cert.X509Certificate
import java.time.Duration
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.TimeUnit
import javax.net.ssl.HostnameVerifier
import javax.net.ssl.SSLContext
import javax.net.ssl.TrustManager
import javax.net.ssl.X509TrustManager


class NetworkChannel(binaryMessenger: BinaryMessenger, context: Context) : Pigeon.NetworkChannelApiRequest {
    private val SHARED_PREFERENCES_NAME = "FlutterSharedPreferences"
    private val sharedPref: SharedPreferences
    private var client: OkHttpClient

    private val responseChannel: Pigeon.NetworkChannelApiResponse

    init {
        this.sharedPref = context.getSharedPreferences(SHARED_PREFERENCES_NAME, Context.MODE_PRIVATE)
        this.client = OkHttpClient.Builder().apply {
            ignoreAllSSLErrors()
        }.build()

        responseChannel = Pigeon.NetworkChannelApiResponse(binaryMessenger)

        Pigeon.NetworkChannelApiRequest.setup(binaryMessenger, this)
    }


    override fun sendRequest(arg: Pigeon.ChannelRequest?) {

        val method = arg?.method

        if (method != "get" && method != "post") {
            return
        }

        val payload = arg.payload

        val url = payload.url

        var request: Request = Request.Builder().url(url).get().build()

        if (method == "post") {
            val body = payload.body
            val postBody: RequestBody = body.toRequestBody()
            request = request.newBuilder().post(postBody).build()
        }

        val credentials = payload.credential

        if (credentials != null &&
                credentials.username != null && credentials.username.isNotEmpty() &&
                credentials.password != null && credentials.password.isNotEmpty())
        {
            val user = credentials.username
            val pass = credentials.password

            val credentials1 = Credentials(user, pass)
            val authenticator = DigestAuthenticator(credentials1)
            val authCache: Map<String, CachingAuthenticator> = ConcurrentHashMap()

            client = this.client.newBuilder()
                    .authenticator(CachingAuthenticatorDecorator(authenticator, authCache))
                    .addInterceptor(AuthenticationCacheInterceptor(authCache))
                    .build()
        }

        val options = arg?.options

        if (options != null) {
            val timeout = options.timeout
            if (timeout != null) {
               client = this.client.newBuilder()
                       .readTimeout(timeout, TimeUnit.SECONDS)
                       .build()
            }
        }

        val channelResponse = Pigeon.ChannelResponse()
        channelResponse.request = arg

        client.newCall(request).enqueue(object : Callback {
            override fun onFailure(call: Call, e: IOException) {

                val _error = Pigeon.NetworkError()
                _error.error = e.toString()
                _error.code = -1

                channelResponse.error = _error

                Handler(Looper.getMainLooper()).post {
                    responseChannel.onResult(channelResponse) { }
                }
            }

            override fun onResponse(call: Call, response: Response) {
                response.use {
                    if (response.isSuccessful) {
                        val payloadData = response.body!!.bytes()

                        channelResponse.result = payloadData

                        // specify dummy error as it cant be null on the android side
                        val _error = Pigeon.NetworkError()
                        _error.error = ""
                        _error.code = -1

                        channelResponse.error = _error

                        Handler(Looper.getMainLooper()).post {
                            responseChannel.onResult(channelResponse) { }
                        }
                    } else {
                        val _error = Pigeon.NetworkError()
                        _error.error = response.body!!.string()
                        _error.code = response.code.toLong()

                        channelResponse.error = _error

                        Handler(Looper.getMainLooper()).post {
                            responseChannel.onResult(channelResponse) { }
                        }
                    }
                }
            }
        })
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
