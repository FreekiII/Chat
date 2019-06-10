<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "Users List">
    <b>List of all users in my chat:</b>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
            <th>Activeness</th>
            <th>Roles</th>
            <th>Edit account</th>
        </tr>
        </thead>
        <tbody>
        <#list usr_list as user>
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td><#if user.isActive()>True<#else>False</#if></td>
                <td>
                    <#list user.roles as role>
                        ${role}<#sep>;
                    </#list>
                </td>
                <td><a href="/users/${user.id}">Edit >></a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@p.page>