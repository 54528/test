<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="guest.*" %>

<%@ page import="org.apache.commons.fileupload.*" %>



<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();

      String tempDir = "/guest/temp";
      String upDir = "/guest/storage";
      
      tempDir=application.getRealPath(tempDir);
      upDir=application.getRealPath(upDir);

%> 


