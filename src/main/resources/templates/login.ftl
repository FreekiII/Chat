<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "Login">
    <#if error??>Such user doesn't exist<#else>Please sign in</#if>
    <form action="/login" method="post">
        <div><label> User Name: <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" value="Sign In"/></div>
    </form>
    <a href="/registration">Create account</a>
</@p.page>