package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import model.R_memberDataBean;

@ServerEndpoint("/broadcasting")
public class Broadsocket {

	R_memberDataBean member;
	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			for (Session client : clients) {
				if (!client.equals(session)) {
					String params = message.substring(0, message.indexOf(":"));
					System.out.println("Message params " + params);
					System.out.println("Message From " + session.getId());
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}