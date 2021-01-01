<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <script src="ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<body>
 <form>
        <textarea name="editor1" id="editor1" rows="10" cols="80">                This is my textarea to be replaced with CKEditor.            </textarea>

        <script>
            CKEDITOR.replace('editor1');
        </script>
    </form>
</body>
</html>
<!-- 
 
 -->