
<%
Folder = Request.querystring("fol")
Folder = "Hall_Photos"
FolderName = "Hall_Photos"
Folder = server.mappath("\") & "\images\" & folder & "\thumbs\"
'response.write Folder
MainImg = Request.querystring("mainimg")
    set fso = CreateObject("Scripting.fileSystemObject") 
    set fold = fso.getFolder(folder) 
    fileCount = fold.files.count 
    dim fNames() 
    redim fNames(fileCount) 
    cFcount = 0 
    for each file in fold.files
		if right(lcase(file.name), 3) = "jpg" Then
        cFcount = cFcount + 1 
        fNames(cFcount) = lcase(file.name) 
		end if
    next 
'	response.write "<hr>" & cFcount & "<hr>"
    for tName = 1 to fileCount 
        for nName = (tName + 1) to fileCount 
            if strComp(fNames(tName),fNames(nName),0)=1 then 
                buffer = fNames(nName) 
                fNames(nName) = fNames(tName) 
                fNames(tName) = buffer 
            end if 
        next 
    next 
	dim cnt
	cnt = 0
	for i = 1 to fileCount 
		if right(fNames(i), 3) = "jpg" then
			if cnt = 5 then
				content = content & "</tr><tr>"
				cnt = 0
			End if
			if InStr(fNames(i), "(custom)") > 0 Then
				fileName = Replace(fNames(i), " (custom)", "_thumb")
				else
				fileName = fNames(i)
			end if
			div = div & "<img border=""0"" src=" & chr(34) & "/images/" & FolderName & "/" & replace(fNames(i), " (custom)","") & Chr(34) & ">"
	        content = content & "<td align=""center""><a onClick=""SwitchImage('/images/" & "/" & FolderName & "/" & replace(fileName, "_thumb", "") & "')"" href=""javascript: void(0)""><img border=""0"" src=" & chr(34) & "/images/" & FolderName & "/thumbs/" & fNames(i) & Chr(34) & "><br>" & Replace(Replace(Replace(fileName ,"_"," "), ".jpg",""),"thumb","") & "</a><br><br></td>"
			cnt = cnt + 1
		end if
    next
'	""/images/" & application("sYear") & "/" & Request.querystring("fol") & "/" & replace(fileName, "_thumb","") & """
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Towing.com - Find Towing &amp; Roadside Services Online</title>
<!--#include virtual="/includes/header.asp"-->

<table align="center" width="100%" cellpadding="0" cellspaceing="0">
	<tr><td colspan="5"><div id="photo" align="center">LOADING Images</div></td></tr>
	<tr><td><a href="/gallery.asp">Back To Gallerys</a></td></tr>
	<tr>
	<%=content %>
	</tr>
</table>
<script>
function SwitchImage(imagePath){

	document.getElementById('photo').innerHTML = "<img src='" + imagePath + "'>"

}

</script>


<!--#include virtual="/includes/footer.asp"-->
<div style="visibility:hidden;">
<%=div%>
</div>
<script>
	document.getElementById('photo').innerHTML = ""
</script>

