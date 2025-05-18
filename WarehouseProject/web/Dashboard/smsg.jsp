<%-- 
    Document   : smsg
    Created on : 10 May 2025, 22:56:23
    Author     : dines
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                    <div id="msgbox">
			<c:if test="${not empty failedMsg }">
                            <div class="notification" style="background-color: #f39c12;" >
                                <span class="notification-text" id="warningMsg">
                                    ${failedMsg}
                                </span>
                            </div>
			</c:if>
                    </div>
			
        <script>
            setTimeout(function() {
                document.getElementById('msgbox').style.display = 'none';
            },3000);
        </script> 