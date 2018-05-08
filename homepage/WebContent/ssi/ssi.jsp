<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="memo.*" %>

<%@ page import="org.apache.commons.fileupload.*" %>



<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();

      String tempDir = "/memov3/temp";
      String upDir = "/memov3/storage";
      
      tempDir=application.getRealPath(tempDir);
      upDir=application.getRealPath(upDir);

%> 


