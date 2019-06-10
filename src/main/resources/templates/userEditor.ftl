<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "User Editor">
    <h1>Edit user ${user.username}</h1>
    <form actrion="/user/${user.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="text" value="${user.username}" name="username" class="my-2 mr-3"/>
        <input type="text" value="${user.password}" name="password"/>
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