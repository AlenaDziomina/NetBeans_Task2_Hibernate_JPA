<%-- 
    Document   : newslist
    Created on : 14.12.2014, 0:08:17
    Author     : Alena.Grouk
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<a class="constColor grey" href="index.do"><bean:message key="menu.header"/></a>
<a class="constColor grey"> >> </a>
<bean:message key="menu.label.list"/>

<bean:define id="confirmMessage">
    <bean:message key="msg.confirmation"/>
</bean:define>
<bean:define id="errMessage">
    <bean:message key="errors.confirmation"/>
</bean:define>

<html:form action="/newsaction?action=delete" 
           onsubmit="return confirmSubmit('deletedId', '${confirmMessage}', '${errMessage}')">
    <html:hidden property="forwardName" value="newslist"/>
    <logic:notEmpty  name="newsForm" property="newsList">
        <table cellpadding="8" class="newstable">
            <logic:iterate id="iter" name="newsForm" property="newsList" indexId="newsIndex">
                <bean:define id="tmpMod" value="${newsIndex + 1}"/>
                <tr><td class="mainrow bold" colspan="2"
                        id="<bean:write name="iter" property="id"/>" >
                        <div class="constWid add">
                            <bean:write name="tmpMod"/>. 
                            <bean:write name="iter" property="title"/></td>
                        </div>
                    <td class="addrow line center"><bean:write name="iter" property="date" 
                                formatKey="format.date"/></td>
                </tr>
                <tr><td class="mainrow"><div class="constWid">
                            <bean:write name="iter" property="brief"/></div></td>
                    <td class="addrow line center"></td>
                    <td class="addrow line center"></td>
                </tr>
                <tr><td class="mainrow" colspan="2"></td>
                    <td class="addrow center">
                        <html:link styleClass="constColor nodecor" action="/newsaction.do?action=view"
                                    paramId="selectedId" paramName="iter" paramProperty="id">
                            <bean:message key="label.view"/></html:link>
                        <html:link styleClass="constColor nodecor" action="/newsaction?action=edit" 
                                   paramId="selectedId" paramName="iter" paramProperty="id">
                            <bean:message key="label.edit"/></html:link>
                        <html:multibox property="deletedId">
                            <bean:write name="iter" property="id"/></html:multibox>
                    </td></tr>
            </logic:iterate>
            <tr><td class="addrow" colspan="2">
                <html:submit  styleClass="butSize"><bean:message key="button.delete"/></html:submit></td></tr>
        </table>       
    </logic:notEmpty>
    
    <logic:empty name="newsForm" property="newsList">
        <h5>News list is empty.</h5>
    </logic:empty>
        
</html:form>
<html:javascript formName="newsForm" staticJavascript="true"/>

