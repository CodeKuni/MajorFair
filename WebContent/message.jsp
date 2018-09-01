<%@page import="org.json.simple.*"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.*, java.lang.*"%>
<%
	request.setCharacterEncoding("utf-8");
	StringBuffer jb = new StringBuffer();
	String line = null;
	BufferedReader reader = request.getReader();
	while ((line = reader.readLine()) != null) {
		jb.append(line);
	}
	String jsonString = jb.toString();

	String text = "";
	Object obj = JSONValue.parse(jsonString);
	JSONObject json = (JSONObject) obj;
	if (json != null) {
		text = json.get("content").toString();
	}
	
	
	

	String cpath = new File(request.getServletPath()).getParent();
	String localPath = application.getRealPath(cpath);
	String path = localPath + "//jsonFile";
	File dirFile = new File(path);
	File[] fileList = dirFile.listFiles();
	for (File tempFile : fileList) {
		if (tempFile.isFile()) { // 파일이면
			String tempPath = tempFile.getParent();
			String tempFileName = tempFile.getName();
			//out.println(tempFileName);
			
			if (tempFileName.equals(text)) {
				path = localPath + "//jsonFile//" + tempFileName;
				//out.println(path);
				String reSendText = "";
				String tmp = "";
				try {
					//파일 객체 생성
					File file = new File(path);
					//입력 스트림 생성
					FileReader filereader = new FileReader(file);
					int singleCh = 0;
					while ((singleCh = filereader.read()) != -1) {
						
							reSendText += (char) singleCh;
					}
					reSendText = reSendText.replaceAll("\n", "\\\\n");
					
					//for (String i : reSendText.split("\n")) {
					//	tmp += (i + "\\n");
					//	System.out.print(i + "\\n");
					//}
					
					
					//reSendText = reSendText.replaceAll("\n", "\\\\n");
					filereader.close();
				} catch (IOException e) {
					System.out.println(e);
				}
%>
{
            "message":{
                "text" : "<%=reSendText%>"
            },
            "keyboard": {
				  "type": "buttons",
				    "buttons": <jsp:include page="jsonData"/>
            }
            }
<%
			}
		}
	}
	
%>
