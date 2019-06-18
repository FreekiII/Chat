<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "Users List">
    <div style="font-weight: bold; font-size: 20px;">List of all users in my chat:</div>
    <table class="table mt-2 table-bordered table-hover">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
            <th>Activeness</th>
            <th>Roles</th>
            <th>Block</th>
            <th>Edit account</th>
        </tr>
        </thead>
        <tbody>
        <#list usr_list as user>
            <!-- Mark users with admin or moderator authority -->
            <#assign containsAdmin = false containsMod = false>
            <#list user.roles as role>
                <#if role.toString() == "ADMIN"><#assign containsAdmin = true></#if>
                <#if role.toString() == "MODERATOR"><#assign containsMod = true></#if>
            </#list>
            <#if containsAdmin>
                <tr class="table-danger">
            <#else>
                <#if containsMod>
                    <tr class="table-success">
                <#else><tr class="table-light">
                </#if>
            </#if>
            <!---->
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td><#if user.isActive()>True<#else>False</#if></td>
                <td>
                    <#list user.roles as role>
                        ${role}<#sep>;
                    </#list>
                </td>
            <td><#if user.isBlocked()>True<#else>False</#if></td>
                <td><a href="/users/${user.id}">Edit >></a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@p.page>