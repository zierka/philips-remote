// Autogenerated from Pigeon (v0.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package dev.flutter.pigeon;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class Pigeon {

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ChannelRequest {
    private Long id;
    public Long getId() { return id; }
    public void setId(Long setterArg) { this.id = setterArg; }

    private String method;
    public String getMethod() { return method; }
    public void setMethod(String setterArg) { this.method = setterArg; }

    private RequestPayload payload;
    public RequestPayload getPayload() { return payload; }
    public void setPayload(RequestPayload setterArg) { this.payload = setterArg; }

    private RequestOptions options;
    public RequestOptions getOptions() { return options; }
    public void setOptions(RequestOptions setterArg) { this.options = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("id", id);
      toMapResult.put("method", method);
      toMapResult.put("payload", payload.toMap());
      toMapResult.put("options", options.toMap());
      return toMapResult;
    }
    static ChannelRequest fromMap(Map<String, Object> map) {
      ChannelRequest fromMapResult = new ChannelRequest();
      Object id = map.get("id");
      fromMapResult.id = (id == null) ? null : ((id instanceof Integer) ? (Integer)id : (Long)id);
      Object method = map.get("method");
      fromMapResult.method = (String)method;
      Object payload = map.get("payload");
      fromMapResult.payload = RequestPayload.fromMap((Map)payload);
      Object options = map.get("options");
      fromMapResult.options = RequestOptions.fromMap((Map)options);
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class RequestPayload {
    private String url;
    public String getUrl() { return url; }
    public void setUrl(String setterArg) { this.url = setterArg; }

    private String body;
    public String getBody() { return body; }
    public void setBody(String setterArg) { this.body = setterArg; }

    private Credential credential;
    public Credential getCredential() { return credential; }
    public void setCredential(Credential setterArg) { this.credential = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("url", url);
      toMapResult.put("body", body);
      toMapResult.put("credential", credential.toMap());
      return toMapResult;
    }
    static RequestPayload fromMap(Map<String, Object> map) {
      RequestPayload fromMapResult = new RequestPayload();
      Object url = map.get("url");
      fromMapResult.url = (String)url;
      Object body = map.get("body");
      fromMapResult.body = (String)body;
      Object credential = map.get("credential");
      fromMapResult.credential = Credential.fromMap((Map)credential);
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class Credential {
    private String username;
    public String getUsername() { return username; }
    public void setUsername(String setterArg) { this.username = setterArg; }

    private String password;
    public String getPassword() { return password; }
    public void setPassword(String setterArg) { this.password = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("username", username);
      toMapResult.put("password", password);
      return toMapResult;
    }
    static Credential fromMap(Map<String, Object> map) {
      Credential fromMapResult = new Credential();
      Object username = map.get("username");
      fromMapResult.username = (String)username;
      Object password = map.get("password");
      fromMapResult.password = (String)password;
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class RequestOptions {
    private Long timeout;
    public Long getTimeout() { return timeout; }
    public void setTimeout(Long setterArg) { this.timeout = setterArg; }

    private String protocol;
    public String getProtocol() { return protocol; }
    public void setProtocol(String setterArg) { this.protocol = setterArg; }

    private String ip;
    public String getIp() { return ip; }
    public void setIp(String setterArg) { this.ip = setterArg; }

    private Long port;
    public Long getPort() { return port; }
    public void setPort(Long setterArg) { this.port = setterArg; }

    private Long apiVersion;
    public Long getApiVersion() { return apiVersion; }
    public void setApiVersion(Long setterArg) { this.apiVersion = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("timeout", timeout);
      toMapResult.put("protocol", protocol);
      toMapResult.put("ip", ip);
      toMapResult.put("port", port);
      toMapResult.put("apiVersion", apiVersion);
      return toMapResult;
    }
    static RequestOptions fromMap(Map<String, Object> map) {
      RequestOptions fromMapResult = new RequestOptions();
      Object timeout = map.get("timeout");
      fromMapResult.timeout = (timeout == null) ? null : ((timeout instanceof Integer) ? (Integer)timeout : (Long)timeout);
      Object protocol = map.get("protocol");
      fromMapResult.protocol = (String)protocol;
      Object ip = map.get("ip");
      fromMapResult.ip = (String)ip;
      Object port = map.get("port");
      fromMapResult.port = (port == null) ? null : ((port instanceof Integer) ? (Integer)port : (Long)port);
      Object apiVersion = map.get("apiVersion");
      fromMapResult.apiVersion = (apiVersion == null) ? null : ((apiVersion instanceof Integer) ? (Integer)apiVersion : (Long)apiVersion);
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ChannelResponse {
    private String status;
    public String getStatus() { return status; }
    public void setStatus(String setterArg) { this.status = setterArg; }

    private byte[] result;
    public byte[] getResult() { return result; }
    public void setResult(byte[] setterArg) { this.result = setterArg; }

    private NetworkError error;
    public NetworkError getError() { return error; }
    public void setError(NetworkError setterArg) { this.error = setterArg; }

    private ChannelRequest request;
    public ChannelRequest getRequest() { return request; }
    public void setRequest(ChannelRequest setterArg) { this.request = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("status", status);
      toMapResult.put("result", result);
      toMapResult.put("error", error.toMap());
      toMapResult.put("request", request.toMap());
      return toMapResult;
    }
    static ChannelResponse fromMap(Map<String, Object> map) {
      ChannelResponse fromMapResult = new ChannelResponse();
      Object status = map.get("status");
      fromMapResult.status = (String)status;
      Object result = map.get("result");
      fromMapResult.result = (byte[])result;
      Object error = map.get("error");
      fromMapResult.error = NetworkError.fromMap((Map)error);
      Object request = map.get("request");
      fromMapResult.request = ChannelRequest.fromMap((Map)request);
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class NetworkError {
    private String error;
    public String getError() { return error; }
    public void setError(String setterArg) { this.error = setterArg; }

    private Long code;
    public Long getCode() { return code; }
    public void setCode(Long setterArg) { this.code = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("error", error);
      toMapResult.put("code", code);
      return toMapResult;
    }
    static NetworkError fromMap(Map<String, Object> map) {
      NetworkError fromMapResult = new NetworkError();
      Object error = map.get("error");
      fromMapResult.error = (String)error;
      Object code = map.get("code");
      fromMapResult.code = (code == null) ? null : ((code instanceof Integer) ? (Integer)code : (Long)code);
      return fromMapResult;
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface AndroidLifecycleHelper {
    void sendToBackground();

    /** Sets up an instance of `AndroidLifecycleHelper` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, AndroidLifecycleHelper api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.AndroidLifecycleHelper.sendToBackground", new StandardMessageCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.sendToBackground();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface NetworkChannelApiRequest {
    void sendRequest(ChannelRequest arg);

    /** Sets up an instance of `NetworkChannelApiRequest` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, NetworkChannelApiRequest api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.NetworkChannelApiRequest.sendRequest", new StandardMessageCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              @SuppressWarnings("ConstantConditions")
              ChannelRequest input = ChannelRequest.fromMap((Map<String, Object>)message);
              api.sendRequest(input);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }

  /** Generated class from Pigeon that represents Flutter messages that can be called from Java.*/
  public static class NetworkChannelApiResponse {
    private final BinaryMessenger binaryMessenger;
    public NetworkChannelApiResponse(BinaryMessenger argBinaryMessenger){
      this.binaryMessenger = argBinaryMessenger;
    }
    public interface Reply<T> {
      void reply(T reply);
    }
    public void onResult(ChannelResponse argInput, Reply<Void> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.NetworkChannelApiResponse.onResult", new StandardMessageCodec());
      Map<String, Object> inputMap = argInput.toMap();
      channel.send(inputMap, channelReply -> {
        callback.reply(null);
      });
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", null);
    return errorMap;
  }
}
