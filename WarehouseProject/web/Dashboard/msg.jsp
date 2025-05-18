<%-- 
    Document   : msg
    Created on : 10 May 2025, 23:05:50
    Author     : dines
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                    <div id="msgbox">
                        <c:if test="${not empty SuccessMsg }">
			    <div class="toast-container position-fixed top-0 end-0 p-3">
                                <div id= "#doneMsg" name= "#doneMsg" class="alert alert-success" role="alert">
                                    ${SuccessMsg}
                                </div>
                            </div>
			</c:if>
			
			<c:if test="${not empty failedMsg }">
			    <div class="toast-container position-fixed top-0 end-0 p-3">
                                <div id= "#errorMsg" name= "#errorMsg" class="alert alert-error" role="alert">
                                    ${failedMsg}
                                </div>
                            </div>   
			</c:if>
                    </div>
			
        <script>
            setTimeout(function() {
                document.getElementById('msgbox').style.display = 'none';
                document.getElementById('msgbox').innerHTML("");
            },3000);
        </script>   
