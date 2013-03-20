<%


PageId = Request.ServerVariables("PATH_INFO") 


'Response.write PageId
Select Case lcase(PageId)
	case "/default.asp"
		PageId = "Home"
		Home = "Selected"
		bi = "Unselected"
		Pic = "Unselected"
	Case "/bookinginformation.asp"
		PageId = "bi"
		Home = "Unselected"
		bi = "Selected"
		pic = "unselected"
	Case "/picturesindv.asp", "/pictures.asp"
		PageId = "pic"
		Home = "Unselected"
		bi = "Unselected"
		pic = "Selected"
	case else
		PageId = "Home"
		Home = "Selected"
		bi = "Unselected"
		Pic = "Unselected"
End Select
'response.write PageId


%>
<script type="text/javascript" src="/includes/NavScript.js"></script>
<script>
	function SelectMe(cellid){
		var homeSel = '<%=pageid%>'
		document.body.style.cursor='pointer'
		if (homeSel == cellid)
		{
		return;
		}
		document.getElementById(cellid).setAttribute("class", "Selected");
		
	}
	
	function UnSelectMe(cellid){
		var homeSel = '<%=pageid%>'
		document.body.style.cursor=''
		if (homeSel == cellid)
		{
		return;
		}
		document.getElementById(cellid).setAttribute("class", "UnSelected");
		
	}
</script>
<link href="/includes/theme.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="silver" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" >
<!-- a cool background image posibly?-->
<table bgcolor="white" align="center" width="900" cellpadding="0"cellspacing="0" style="border-bottom:solid 5px #990000;">
	<tr>
		<td>
			<span class="HeaderTitle">Bella Sala Hall</span><br><br>
		</td>
	</tr>
</table>
<!--Navigation Bar-->
<table bgcolor=" E5E5E5" cellpadding="0"cellspacing="0" width="900" align="center">
	<tr>
		<td>
			&nbsp;
		</td>
		<td>
			<table cellpadding="0" cellspacing="0" style="padding-top:2px;">
				<tr>
					<td class="<%=home%>" onclick="document.location.href='/'" onmouseover="SelectMe('home')" id="home" onmouseout="UnSelectMe('home')">Home</td>
					<td align="center" class="nav_brk">&nbsp;&nbsp;&nbsp;</td>
					<td class="<%=bi%>" onclick="document.location.href='/BookingInformation.asp'" onmouseover="SelectMe('bi')" id="bi" onmouseout="UnSelectMe('bi')">Booking Information</td>
					<td align="center" class="nav_brk">&nbsp;&nbsp;&nbsp;</td>
					<td class="<%=pic%>" onclick="document.location.href='/Pictures.asp'" onmouseover="SelectMe('pic')" id="pic" onmouseout="UnSelectMe('pic')">Pictures</td>
					<td align="center" class="nav_brk">&nbsp;&nbsp;&nbsp;</td>										
				</tr>
			</table>
		</td>
	</tr>
</table>
<table bgcolor="white" cellpadding="0"cellspacing="0" width="900" align="center">
	<tr>
		<td>