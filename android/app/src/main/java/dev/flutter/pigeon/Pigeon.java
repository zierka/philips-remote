// Autogenerated from Pigeon (v0.1.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package dev.flutter.pigeon;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import java.util.ArrayList;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings("unused")
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

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("id", id);
      toMapResult.put("method", method);
      toMapResult.put("payload", payload.toMap());
      toMapResult.put("options", options.toMap());
      return toMapResult;
    }
    static ChannelRequest fromMap(HashMap map) {
      ChannelRequest fromMapResult = new ChannelRequest();
      Object id = map.get("id");
      fromMapResult.id = (id == null) ? null : ((id instanceof Integer) ? (Integer)id : (Long)id);
      Object method = map.get("method");
      fromMapResult.method = (String)method;
      Object payload = map.get("payload");
      fromMapResult.payload = RequestPayload.fromMap((HashMap)payload);
      Object options = map.get("options");
      fromMapResult.options = RequestOptions.fromMap((HashMap)options);
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

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("url", url);
      toMapResult.put("body", body);
      toMapResult.put("credential", credential.toMap());
      return toMapResult;
    }
    static RequestPayload fromMap(HashMap map) {
      RequestPayload fromMapResult = new RequestPayload();
      Object url = map.get("url");
      fromMapResult.url = (String)url;
      Object body = map.get("body");
      fromMapResult.body = (String)body;
      Object credential = map.get("credential");
      fromMapResult.credential = Credential.fromMap((HashMap)credential);
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

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("username", username);
      toMapResult.put("password", password);
      return toMapResult;
    }
    static Credential fromMap(HashMap map) {
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

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("timeout", timeout);
      return toMapResult;
    }
    static RequestOptions fromMap(HashMap map) {
      RequestOptions fromMapResult = new RequestOptions();
      Object timeout = map.get("timeout");
      fromMapResult.timeout = (timeout == null) ? null : ((timeout instanceof Integer) ? (Integer)timeout : (Long)timeout);
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ChannelResponse {
    private Long id;
    public Long getId() { return id; }
    public void setId(Long setterArg) { this.id = setterArg; }

    private String status;
    public String getStatus() { return status; }
    public void setStatus(String setterArg) { this.status = setterArg; }

    private byte[] result;
    public byte[] getResult() { return result; }
    public void setResult(byte[] setterArg) { this.result = setterArg; }

    private NetworkError error;
    public NetworkError getError() { return error; }
    public void setError(NetworkError setterArg) { this.error = setterArg; }

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("id", id);
      toMapResult.put("status", status);
      toMapResult.put("result", result);
      toMapResult.put("error", error.toMap());
      return toMapResult;
    }
    static ChannelResponse fromMap(HashMap map) {
      ChannelResponse fromMapResult = new ChannelResponse();
      Object id = map.get("id");
      fromMapResult.id = (id == null) ? null : ((id instanceof Integer) ? (Integer)id : (Long)id);
      Object status = map.get("status");
      fromMapResult.status = (String)status;
      Object result = map.get("result");
      fromMapResult.result = (byte[])result;
      Object error = map.get("error");
      fromMapResult.error = NetworkError.fromMap((HashMap)error);
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

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("error", error);
      toMapResult.put("code", code);
      return toMapResult;
    }
    static NetworkError fromMap(HashMap map) {
      NetworkError fromMapResult = new NetworkError();
      Object error = map.get("error");
      fromMapResult.error = (String)error;
      Object code = map.get("code");
      fromMapResult.code = (code == null) ? null : ((code instanceof Integer) ? (Integer)code : (Long)code);
      return fromMapResult;
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface NetworkChannelApiRequest {
    void sendRequest(ChannelRequest arg);

    /** Sets up an instance of `NetworkChannelApiRequest` to handle messages through the `binaryMessenger` */
    static void setup(BinaryMessenger binaryMessenger, NetworkChannelApiRequest api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.NetworkChannelApiRequest.sendRequest", new StandardMessageCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            HashMap<String, HashMap> wrapped = new HashMap<>();
            try {
              @SuppressWarnings("ConstantConditions")
              ChannelRequest input = ChannelRequest.fromMap((HashMap)message);
              api.sendRequest(input);
              wrapped.put("result", null);
            }
            catch (Exception exception) {
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
      HashMap inputMap = argInput.toMap();
      channel.send(inputMap, channelReply -> {
        callback.reply(null);
      });
    }
  }
  private static HashMap wrapError(Exception exception) {
    HashMap<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", null);
    return errorMap;
  }
}
