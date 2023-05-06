package server.ws;

import jakarta.websocket.server.ServerEndpoint;
import jakarta.websocket.*;
import java.time.*;

@ServerEndpoint("/websocketendpoint")
public class WsServer {
	@OnOpen
    public void onOpen(){
        System.out.println("Open Connection");
    }
    @OnClose
    public void onClose(){
        System.out.println("Close Connection");
    }
    @OnMessage
    public String onMessage(String message){
        System.out.println("Message from the client: " + message);
        String echoMsg = "Echo from the server : " + "[3, 19223201, {status:Accepted, currentTime:" + LocalDateTime.now() + ", heartbeatInterval:300}]";
        return echoMsg;
    }
    @OnError
    public void onError(Throwable e){
        e.printStackTrace();
    }
}