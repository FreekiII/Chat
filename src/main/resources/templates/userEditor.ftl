<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "User Editor">
    <h1>Edit user ${user.username}</h1>
    <form actrion="/user" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="text" value="${user.username}" name="username"/>
        <input type="text" value="${user.password}" name="password"/>
        <input type="hidden" value="${user.id}" name="id"/>
        <#list roles as role>
            <div>
                <label>
                    <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>
                    ${role}
                </label>
            </div>
        </#list>
        <button type="submit">Confirm</button>
    </form>
</@p.page>