<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "Registration">
    <#if error??>${error}<#else>Fill up your credentials</#if>
    <form action="/registration" method="post">
        <div><label> User Name: <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>
            <button type="submit">Register</button>
        </div>
    </form>
</@p.page>